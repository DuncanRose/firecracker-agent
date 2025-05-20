#!/bin/bash
set -e

ROOTFS=firecracker/rootfs/agent.ext4
SIZE_MB=1024

# Create an empty file
dd if=/dev/zero of=$ROOTFS bs=1M count=$SIZE_MB

# Format it
mkfs.ext4 $ROOTFS

# Mount it
mkdir -p /mnt/agent-rootfs
sudo mount -o loop $ROOTFS /mnt/agent-rootfs

# Install minimal rootfs
sudo debootstrap --arch=amd64 jammy /mnt/agent-rootfs http://archive.ubuntu.com/ubuntu/

# Inject agent code and dependencies
sudo cp -r agent /mnt/agent-rootfs/root/
echo -e "#!/bin/bash\napt update\napt install -y python3 python3-pip\npip3 install -r /root/agent/requirements.txt\npython3 /root/agent/main.py" | sudo tee /mnt/agent-rootfs/root/start.sh
sudo chmod +x /mnt/agent-rootfs/root/start.sh

# Set default init
echo -e "[Service]\nExecStart=/root/start.sh\n[Install]\nWantedBy=multi-user.target" | sudo tee /mnt/agent-rootfs/etc/systemd/system/agent.service
sudo ln -s /etc/systemd/system/agent.service /mnt/agent-rootfs/etc/systemd/system/default.target.wants/agent.service

# Cleanup
sudo umount /mnt/agent-rootfs

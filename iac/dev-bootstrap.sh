#!/bin/bash
set -e

echo "=== 🔧 Bootstrapping Development Environment ==="

# Install required packages
sudo apt update
sudo apt install -y python3 python3-pip curl git build-essential debootstrap

# Create directories if missing
mkdir -p firecracker/kernel firecracker/rootfs agent

# Download Firecracker binary
echo "📦 Downloading Firecracker..."
curl -LOJ https://github.com/firecracker-microvm/firecracker/releases/download/v1.5.1/firecracker-v1.5.1-x86_64.tgz
tar -xzf firecracker-v1.5.1-x86_64.tgz
chmod +x firecracker-v1.5.1-x86_64
sudo mv firecracker-v1.5.1-x86_64 /usr/local/bin/firecracker

# Optional: check firecracker version
firecracker --version

echo "✅ Dev environment bootstrapped!"

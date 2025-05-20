# 🔧 Manual Setup for Firecracker (Apple Silicon + Lima)

This guide documents the clean working installation process for Firecracker inside a Lima VM on Apple Silicon (M1/M2). It assumes you're already inside a running Lima shell.

---

## ✅ Step 1: Clean up any previous attempts

```bash
rm -rf firecracker-v1.5.1-aarch64*
rm -rf release-v1.5.1-aarch64
sudo rm -f /usr/local/bin/firecracker
```

---

## 📦 Step 2: Download and extract Firecracker

```bash
curl -LO https://github.com/firecracker-microvm/firecracker/releases/download/v1.5.1/firecracker-v1.5.1-aarch64.tgz
tar -xzf firecracker-v1.5.1-aarch64.tgz
```

Verify:
```bash
ls release-v1.5.1-aarch64
# You should see firecracker-v1.5.1-aarch64, jailer-v1.5.1-aarch64, etc.
```

---

## 🚀 Step 3: Install Firecracker binary

```bash
sudo mv release-v1.5.1-aarch64/firecracker-v1.5.1-aarch64 /usr/local/bin/firecracker
sudo chmod +x /usr/local/bin/firecracker
```

Test:
```bash
file /usr/local/bin/firecracker
# Output: ELF 64-bit LSB executable, ARM aarch64 ...
```

---

## 🧪 Step 4: Run a quick test

```bash
firecracker --api-sock /tmp/test.socket
```

✅ If it waits silently, Firecracker is working. Press `Ctrl+C` to exit.

---

## 🟢 Next: Start your microVM

```bash
./firecracker/start-vm.sh
```

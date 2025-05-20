# Firecracker Agent AI (LangChain + Ollama)

A redeployable, sandboxed AI agent that runs in Firecracker microVMs using LangChain and communicates with LLaMA 3 served by Ollama on the host.

## Requirements

- macOS with Homebrew
- Lima (`brew install lima`)
- Ollama (`brew install ollama`)
- Firecracker (installed inside the Lima VM)

## Getting Started

### 1. Start Ollama on macOS host
```bash
ollama run llama3
```

### 2. Start Lima
```bash
limactl start lima/lima.yaml
limactl shell default
```

### 3. Inside Lima VM
```bash
./iac/build-rootfs.sh
./firecracker/start-vm.sh
```

The agent inside the microVM will talk to Ollama running on the macOS host via `http://host.lima.internal:11434`.

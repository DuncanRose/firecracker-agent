#!/bin/bash
set -e
firecracker --api-sock /tmp/firecracker.socket --config-file firecracker/config.json

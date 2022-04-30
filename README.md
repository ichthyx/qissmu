# Qissmu

A very simple and dumb (K.I.S.S) script (easily hackable) for fast testing/bootstraping cloud-init QEMU VM (image).

Why : I like to make quick test of script, ansible-playbook, without bloating my os with libvirt and it's complicated network stack which modify your iptables or crazy ruby script like vagrant, or any big bloated thing like vbox...

# Quick launch a VM for testing :

When you don't have time and just want a quick vm :

    qissmu -fastpls debian

Delete all cache/iso/images/hashes which is usually in .qissmucache of current dir

    qissmu -clean

Usually you create a script with variables that setup the VM:

```
CLOUD_IMAGE="https://cloud.debian.org/cdimage/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2"
HASH="https://cloud.debian.org/cdimage/cloud/bullseye/latest/SHA512SUMS"
VM_USER_NAME="testuser"
VM_USER_PASSWORD="1234"
VM_MEMORY_SIZE="4096"
RESIZE="4G"

source qissmu

# qissmu will create a variable: QISSMU_IP_ADDR
export QISSMU_IP_ADDR=${QISSMU_IP_ADDR}

# or

myscript $QISSMU_IP_ADDR
```

# Network

By default bind ssh (22) to localhost on port 2222 (qemu user mode)

You can map port with bash array using qemu syntax:

```
NETWORK_USERMODE_PORTREDIR=(tcp::5432-:5432 tcp::443-:443 tcp::2222-:22 udp::53-:53)
qissmu
```

You can use an existing brige with -bridge

    NETWORK_BRIDGE="br0"
    qissmu -bridge

# Example

```
#!/bin/bash

CLOUD_IMAGE="https://cloud.debian.org/cdimage/cloud/bullseye/latest/debian-11-genericcloud-amd>
HASH="https://cloud.debian.org/cdimage/cloud/bullseye/latest/SHA512SUMS"
VM_USER_NAME="ansible_test"
VM_USER_PASSWORD="1234"
VM_MEMORY_SIZE="4096"
RESIZE="4G"
BTRFS_NOCOW=1
NETWORK_BRIDGE="mybridge0"

source qissmu -bridge

source ./ansible.sh
```

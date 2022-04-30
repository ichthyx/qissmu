#!/bin/bash

CLOUD_IMAGE="https://cloud.debian.org/cdimage/cloud/bullseye/latest/debian-11-genericcloud-amd64.qcow2"
HASH="https://cloud.debian.org/cdimage/cloud/bullseye/latest/SHA512SUMS"
VM_USER_NAME="testuser"
VM_USER_PASSWORD="1234"
VM_MEMORY_SIZE="4096"
RESIZE="4G"
BTRFS_NOCOW=1

source qissmu -bridge

export QISSMU_IP_ADDR=${QISSMU_IP_ADDR}

source ./ansible.sh
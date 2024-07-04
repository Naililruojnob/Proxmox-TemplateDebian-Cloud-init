#!/bin/bash

id=9999

# Check if wget is installed
if ! command -v wget &> /dev/null; then
    echo "wget could not be found, installing..."
    apt-get update && apt-get install -y wget
fi

# Check if virt-customize is installed
if ! command -v virt-customize &> /dev/null; then
    echo "virt-customize could not be found, installing..."
    apt-get update && apt-get install -y libguestfs-tools
fi

# Download Debian image
wget https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2 -O debian-12-generic-amd64.qcow2

# Customize the image to include qemu-guest-agent
virt-customize -a debian-12-generic-amd64.qcow2 --install qemu-guest-agent

# Create the VM
qm create $id --name Template-debian --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci

# Import the disk
qm importdisk $id debian-12-generic-amd64.qcow2 local-lvm --format raw

qm set $id --scsi0 local-lvm:vm-$id-disk-0

# Resize the disk
qm disk resize $id scsi0 20G

# Set VM options
qm set $id --boot order=scsi0
qm set $id --cpu host --cores 2 --memory 4096
qm set $id --ide2 local:cloudinit
qm set $id --agent enabled=1

# Convert to template
qm template $id

# Clean up
rm debian-12-generic-amd64.qcow2

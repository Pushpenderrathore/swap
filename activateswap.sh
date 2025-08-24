#!/bin/bash/

# Function to activate secure swap
function activateswap() {
    local SWAPSIZE="${1:-16G}"  # default to 16G if no arg passed

    echo "[+] Creating secure swap of size $SWAPSIZE at /swapdir/swapfile..."

    # Clean up any old swap
    sudo swapoff /swapdir/swapfile 2>/dev/null
    sudo rm -f /swapdir/swapfile

    sudo mkdir -p /swapdir
    sudo chattr +C /swapdir
    sudo dd if=/dev/zero of=/swapdir/swapfile bs=1G count=$((${SWAPSIZE//[Gg]})) status=progress
    sudo chmod 600 /swapdir/swapfile
    sudo mkswap /swapdir/swapfile
    sudo swapon /swapdir/swapfile

    echo "[+] Swap of $SWAPSIZE activated successfully!"
    #grep -q '/swapdir/swapfile' /etc/fstab || echo '/swapdir/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
}
    

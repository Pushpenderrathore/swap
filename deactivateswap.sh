#!/bin/bash

# Function to deactivate and remove swap
function deactivateswap() {
    echo "[+] Deactivating and cleaning up swap..."
    sudo swapoff /swapdir/swapfile
    sudo rm -f /swapdir/swapfile
    sudo rmdir /swapdir
    sudo sed -i '/\/swapdir\/swapfile/d' /etc/fstab
    echo "[+] Swap removed successfully!"
}

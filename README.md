# Grub-Nvidia-Entry
If you installed Nvidia drivers through negativo17.org or RPMfusion, the Nvidia card would always be on by default. As the dedicated GPU consumes a lot of power, it is a significant problem to those using laptops.

BlacklistNvidia.sh makes Grub load Nouveau instead of Nvidia drivers on normal basis and creates a new entry which loads Nvidia drivers.

[Why is this method preferred over Bumblebee?](https://superdanby.github.io/Blog/dealing-with-nvidia-optimus.html)

## Prerequisites
*   UEFI
*   Nvidia driver

## Supported Operating Systems
*   Fedora 27
*   Fedora 26

## Instructions
*   After installing Nvidia drivers, run BlacklistNvidia.sh.
*   If you'd like to use the drivers with Secure Boot on, run SignNvidia.sh.
*   Rerun the script(s) after a kernel update will make the created entry use the new kernel.

## Caution
The script overwrites /etc/grub.d/40_custom.

## Issues
<del>Nouveau seems to be blocked from Gnome's right click menu with kernel 4.13.12 and above when Nvidia is installed(?)</del>
But it works fine if you start an application with `DRI_PRIME=1` from terminal.

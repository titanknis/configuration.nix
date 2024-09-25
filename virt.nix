{ config, lib, pkgs, ... }:

{
  # Virtual machine settings

  # Enable the libvirt daemon for managing virtual machines
  virtualisation.libvirtd.enable = true;

  # Enable OVMF (UEFI firmware) support for virtual machines
  # This is often necessary for modern Windows installations
  virtualisation.libvirtd.qemu.ovmf.enable = true;

  # Enable dconf (needed for virt-manager settings)
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [

    virt-manager  # Graphical user interface for managing virtual machines
    qemu          # The hypervisor that actually runs the virtual machines
    OVMF          # Open Virtual Machine Firmware (for UEFI support)
    spice-vdagent # Enables better integration between host and guest (e.g., clipboard sharing)
    virtio-win    # VirtIO drivers for Windows guests (improves performance)

    ];
}

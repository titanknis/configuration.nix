{ config, lib, pkgs, ... }:

{
  # Import hardware and custom configurations
  imports =
    [
      ./hardware-configuration.nix  # Hardware-specific configuration
      ./git.nix                     # Git-specific configuration
      ./firewall.nix                # Firewall configuration
      ./boot.nix                    # Luks, grub and kernel configuration
      ./desktop.nix
      ./packages.nix
      ./users.nix
      ./shell.nix
      #./vm.nix                      # Virtual machine-specific config
      #./disko.nix
  ];

  # GPG Configuration
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;  # Enable GPG for SSH key management
  };

  # Disable the OpenSSH daemon
  services.openssh.enable = false;

  # Enable nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Maintain compatibility with original NixOS version
  system.stateVersion = "24.05";  # Keep original NixOS state version
}

{ config, lib, pkgs, ... }:

{
  # Import hardware and custom configurations
  imports =
    [
      ./hardware-configuration.nix  # Hardware-specific configuration
      #./vm.nix                      # Virtual machine-specific config
      ./git.nix                     # Git-specific configuration
      ./firewall.nix                # Firewall configuration
     #./disko.nix
      ./boot.nix                    # Luks, grub and kernel configuration
      ./desktop.nix
      ./packages.nix
    ];

  # networking configuration
  networking.hostname = "nixos";		# set system hostname
  networking.networkmanager.enable = true;	# enable networkmanager for easier network management

  # timezone and locale settings
  time.timezone = "africa/tunis";          # set the correct timezone
  i18n.defaultlocale = "en_us.utf-8";      # set system locale
  console = {
    font = "lat2-terminus16";              # console font
    usexkbconfig = true;                   # use xkb configuration for keyboard layout in tty
  };

  # shell configuration (zsh)
  programs.zsh.enable = true;                          # enable zsh
  programs.zsh.syntaxhighlighting.enable = true;       # enable syntax highlighting
  programs.zsh.autosuggestions.enable = true;          # enable autosuggestions

  programs.starship.enable = true;          # enable starship prompt
  users.defaultusershell = pkgs.zsh;        # set zsh as the default shell


  # gpg configuration
  programs.gnupg.agent = {
    enable = true;
    enablesshsupport = true;  # enable gpg for ssh key management
  };

  # disable the openssh daemon
  services.openssh.enable = false;

  # enable nix flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # system configuration backup
  #system.copysystemconfiguration = true;  # backup this nixos configuration

  # maintain compatibility with original nixos version
  system.stateversion = "24.05";  # keep original nixos state version
}


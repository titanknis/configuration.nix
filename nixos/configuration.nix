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
    ];

  # LUKS Encryption Setup
  boot.initrd = {
      luks.devices = {
        luksCrypted = {
          device = "/dev/nvme0n1p2";  # Update with the actual device UUID
          preLVM = true;              # Unlock LUKS before LVM activation
          allowDiscards = true;       # Enable TRIM for SSDs
        };
      };
  };


  # Bootloader Configuration (GRUB)
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";		# Install GRUB on the EFI system partition 
  boot.loader.grub.copyKernels = true;		# Automatically copy kernels
  boot.loader.grub.efiSupport = true;		# Enable EFI support for GRUB
  boot.loader.grub.enableCryptodisk = true ;	# Enable encrypted disk support for GRUB

  boot.loader.efi.efiSysMountPoint = "/boot";	# Mount point for EFI partition
  boot.loader.efi.canTouchEfiVariables = true;		# Allow modification of EFI variables

  # Custom GRUB Entries for Reboot and Poweroff
  boot.loader.grub.extraEntries = ''
      menuentry "Reboot" { reboot }
      menuentry "Poweroff" { halt }
  '';

  # Kernel Configuration (Using Zen Kernel)
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # Networking Configuration
  networking.hostName = "nixos";		# Set system hostname
  networking.networkmanager.enable = true;	# Enable NetworkManager for easier network management

  # Timezone and Locale Settings
  time.timeZone = "Africa/Tunis";          # Set the correct timezone
  i18n.defaultLocale = "en_US.UTF-8";      # Set system locale
  console = {
    font = "Lat2-Terminus16";              # Console font
    useXkbConfig = true;                   # Use XKB configuration for keyboard layout in tty
  };

  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Set XKB keyboard layout options
  services.xserver.xkb = {
    layout = "us";                          # Set the keyboard layout to US
    variant = "colemak_dh";                 # Use the Colemak DH variant
    #options = "misc:extend,lv5:caps_switch_lock,compose:menu";		# Alternative XKB options (commented out)
    options = "caps:escape, compose:ralt, terminate:ctrl_alt_bksp";	# Set additional XKB options
  };

  # Desktop Environment and Display Manager
  services.desktopManager.plasma6.enable = true;        # Enable KDE Plasma 6
  services.displayManager.sddm.enable = true;		# Enable SDDM display manager
  services.displayManager.defaultSession = "plasma";    # Set Plasma as the default session (Wayland)

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable bluetooth.
  hardware.bluetooth.enable = true;		# Enable Bluetooth 
  hardware.bluetooth.powerOnBoot = true;	# Power on Bluetooth by default

  # Audio System Configuration
  services.pipewire.enable = true;                      # Enable PipeWire (audio system)
  services.pipewire.pulse.enable = true;                # Enable PulseAudio support within PipeWire

  # Input Device Configuration
  services.libinput.enable = true;      # Enable touchpad support (default in most desktop managers)

  # Shell Configuration (Zsh)
  programs.zsh.enable = true;                          # Enable Zsh
  programs.zsh.syntaxHighlighting.enable = true;       # Enable syntax highlighting
  programs.zsh.autosuggestions.enable = true;          # Enable autosuggestions

  programs.starship.enable = true;          # Enable Starship prompt
  users.defaultUserShell = pkgs.zsh;        # Set Zsh as the default shell

  # User Configuration
  users.users.titanknis = {
    isNormalUser = true;
    home = "/home/titanknis";
    description = "System Master";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "kvm" ];  # Add user to sudo and other groups
  };

  # Allow unfree software
  #nixpkgs.config.allowUnfree = true;


  # Installed System Packages
  environment.systemPackages = with pkgs; [
    # Browsers and Editors
    firefox                             # Web browser
    vscodium                            # Visual Studio Code alternative
    neovim                              # Text editor
    #spotify   				# Music streaming service

    # Development Tools
    gcc                                 # C/C++ compiler
    gdb                                 # GNU Debugger
    codeblocks                          # Code::Blocks IDE
    git                                 # Git version control

    # CLI Utilities
    wget                                # Download tool (better for resuming)
    curl                                # Download tool (supports more protocols)
    zoxide                              # Z directory jumper
    fzf                                 # Fuzzy finder for terminal
    bat                                 # Enhanced 'cat' with syntax highlighting

    # Terminal Emulator
    kitty                               # Terminal emulator

    # Wine and Winetricks
    #wine                                # Wine for running Windows applications
    #winetricks                          # Winetricks for managing Wine

    # File Management
    #unrar                               # Tool for extracting RAR archives

    # Fun and Miscellaneous
    neofetch                            # System info display
    #sl                                  # Steam locomotive animation
    cmatrix                             # Matrix effect in terminal
    asciiquarium			# Watch an aquarium in terminal
    cowsay                              # ASCII cowspeak
    ponysay				# Pony-themed version of cowsay for fun ASCII art
    fortune                             # Display random quotes
    pipes                               # Animated pipes in terminal
    figlet                              # Generate ASCII art text

    # Clipboard and Clipboard Tools
    wl-clipboard                        # Clipboard manager for Wayland

    # Starship Prompt and Fonts
    starship                            # Cross-shell prompt
    fira-code                           # Monospaced programming font
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

  # System Configuration Backup
  #system.copySystemConfiguration = true;  # Backup this NixOS configuration

  # Maintain compatibility with original NixOS version
  system.stateVersion = "24.05";  # Keep original NixOS state version
}


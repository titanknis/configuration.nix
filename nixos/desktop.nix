{ config, lib, pkgs, ... }:

{

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

}


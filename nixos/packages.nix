{ config, lib, pkgs, ... }:

{

# Installed System Packages
  environment.systemPackages = with pkgs; [
    # Browsers and Editors
    firefox                             # Web browser
    vscodium                            # Visual Studio Code alternative
    neovim                              # Text editor
    vlc                                 # Video player
    #spotify   				            # Music streaming service

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
    ranger                              # Terminal file manager with keyboard shortcuts

    # Terminal Emulator
    kitty                               # Terminal emulator

    # Wine and Winetricks
    #wine                                # Wine for running Windows applications
    #winetricks                          # Winetricks for managing Wine

    # File Management
    #unrar                               # Tool for extracting RAR archives

    # Fun and Miscellaneous
    neofetch                            # System info display
    sl                                  # Steam locomotive animation
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
}


{ config, lib, pkgs, ... }:

{

  # installed system packages
  environment.systempackages = with pkgs; [
    # browsers and editors
    firefox                             # web browser
    vscodium                            # visual studio code alternative
    neovim                              # text editor
    vlc
    #libreoffice
    #onlyoffice-bin
    #spotify   				# music streaming service

    # development tools
    gcc                                 # c/c++ compiler
    gdb                                 # gnu debugger
    codeblocks                          # code::blocks ide
    git                                 # git version control

    # cli utilities
    wget                                # download tool (better for resuming)
    curl                                # download tool (supports more protocols)
    zoxide                              # z directory jumper
    fzf                                 # fuzzy finder for terminal
    bat                                 # enhanced 'cat' with syntax highlighting
    ranger                              # terminal file manager with keyboard shortcuts

    # terminal emulator
    kitty                               # terminal emulator

    # wine and winetricks
    #wine                                # wine for running windows applications
    #winetricks                          # winetricks for managing wine

    # file management
    #unrar                               # tool for extracting rar archives

    # fun and miscellaneous
    neofetch                            # system info display
    sl                                  # steam locomotive animation
    cmatrix                             # matrix effect in terminal
    asciiquarium			# watch an aquarium in terminal
    cowsay                              # ascii cowspeak
    ponysay				# pony-themed version of cowsay for fun ascii art
    fortune                             # display random quotes
    pipes                               # animated pipes in terminal
    figlet                              # generate ascii art text

    # clipboard and clipboard tools
    wl-clipboard                        # clipboard manager for wayland

    # starship prompt and fonts
    starship                            # cross-shell prompt
    fira-code                           # monospaced programming font
  ];
}


{ config, pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    # nixpkgs.config.allowUnsupportedSystem = true;
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs;
    [ 
   # System Tools / Utilities
    git
    tmux
    lazygit
    neofetch
    fzf
    man
    htop
    wget
    xsel
    tree
    unzip
    ripgrep
    tldr
    catimg
    nmap
   # Organize
    taskwarrior 
    timewarrior 
    sc-im
    tmate
    aerc
     dante
     scdoc
    # Installed calcurse through homebrew as it didnt work wth darwin nix 
    topydo 
   # Browse and Search 
    w3m
    ddgr
   # Communicate
    signal-cli
     qrencode 
     dbus 
   # Sound
    sox
    id3v2
    lame
    ffmpeg
    #installed ecasound through homebrew as it didnt work with darwin nix
   # Media
    youtube-viewer
    cmus
    youtube-dl
    mplayer
    mpv-unwrapped #didn't build on i386
    feh
    imagemagick
   # Publishing Platforms
    github-cli
    gh
    rtv
      urlscan   
      urlview
      urlwatch
   # Fun Stuff
    fortune
    figlet
    lolcat
    nethack
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  # services.nix-daemon.enable = true;
  #  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

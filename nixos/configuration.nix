# Vowel - Very Opinionated Writing Environment for Less. A targeted command line based writing environment based on NixOS. 
# NixOS manual (accessible by running ‘nixos-help’). Check `man configuration.nix` for more details on config file. 

{ config, pkgs,  ... }:

{ imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # tmux and tmux status bar configuration.  
      ./tmux/default.nix
     ];

# System boot.

  boot.loader.grub.enable = true; 
  boot.loader.grub.version = 2;		 # Use the GRUB 2 boot loader.Good for old system. Newer ones use efi. Refer to nixos-help
  boot.loader.grub.device = "/dev/sda"; 				 # hard drive you want to install Grub.

 # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";
   console = {
     font = "Lat2-Terminus22";
     keyMap = "us";
   };

   
# Environment variables 
  environment.etc.current-nixos-config.source = ./.;
  environment.variables = {
    NIXOS_CONFIG = "/etc/nixos/configuration.nix";
    NIXPKGS_ALLOW_UNFREE = "1";
    EDITOR = "vim";
    VISUAL = "vim";
    BROWSER = "w3m";
    RTV_BROWSER = "w3m";
    RTV_EDITOR = "vim";
    RTV_URLVIEWER = "urlview";
  };
# Time

  time.timeZone = "America/Los_Angeles";

# Network - Let networkmanager handle this shit.
  
  networking = {
    hostName = "desko";
    networkmanager.enable = true;
   
    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
  };

# System Services
 
   services.openssh.enable = true;		 # ssh
   services.printing.enable = true;		 # Print - Do I need it ?

# Enable sound.
  sound.enable = true;
  sound.mediaKeys.enable = true;
  hardware.pulseaudio.enable = true;

# Extra Outputs for all the packages. For example corutils offer info. 

  environment.extraOutputsToInstall = [ "man" "doc" "info" "devdoc" ];

# Enable Flakes from unstable 
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';


# Configurable modules. If enabled here, They dont need to be installed via pkgs. 
# NixOS automatically creates a config file in /etc for these programs. 
# Not sure as of now if this is the way to configure packages cuz I beleive in collabaratively built config by people who know these packages well enough and update the config regularly. 
# vim , tmux xmonad etc for example have nice config repos on github. Others can go here ?
  programs = {
    bash.enableCompletion = true;
    bash.shellInit = 
          ''
           set -o  vi;
           
           if command -v fzf-share >/dev/null; then
               source "$(fzf-share)/key-bindings.bash"
               source "$(fzf-share)/completion.bash"
           fi  
          '';
    less.enable = true;
    sway.enable = true; #Implements sway wm with sandard config and Wayland - a replacement for X.  
    sway.extraPackages = with pkgs; [
                                      xwayland     # To Support X applications
                                      dmenu        # Program search in Swaybar
                                      wl-clipboard # Wayland clipboard
                                      swaylock     # Screen lock in Wayland world
                                      swayidle     # Lock sceen afer say 30 minutes of inacivity
                                      termite      # Nice terminal. I bind it to Mod+enter in sawy config
                                      light        # To control the brighness - works in tty as well as Wayland
                                      mako         # Wayland Notifications
                                      waybar       # Make sway look like a Desktop with configurable top bar
                                      grim         # Wayland compatible screenshots
                                      xdg_utils    # Open applicaions with "xdg_open" in wayland too.
                                     ];
    waybar.enable= true;
    tmux.enable=true;
    thefuck.enable = true;
  };


  documentation.man.enable = true;
  documentation.man.generateCaches = true;
  documentation.nixos.includeAllModules = true;

# Define a user account. Don't forget to set a password with ‘passwd’.

  users.users.amj = {
    isNormalUser = true;
    extraGroups = [ "root" "wheel" "networkmanager" "video" "sudo" ];
    shell = pkgs.bash;
  };

# automatically discover usb devices and mount them.

  services.udisks2.enable = true;   # Enable udisks2.
  services.devmon.enable = true;    # Enable external device automounting.
  boot.kernelModules = [ "fuse" ];  # Need to figure this out.


# Install any additional fonts that I require to be used with xmonad
  fonts.fonts = with pkgs; [
    opensans-ttf             # Used in in my xmobar configuration
  ];

# Instal apps - Primarily command line; few for graphical.

  nixpkgs.config.allowUnfree = true; #For latest firefox. God knows why its unfree. 

  environment.systemPackages = with pkgs; [
 # CLI Apps or rather apps without the need of X or Wayland. 
    # System Tools / Utilities
    git
    lazygit
    neofetch
    fbterm
    man
    htop
    kbd
    wget
    xsel
    tree
    unzip
    ripgrep
    tldr
    vifm
    megacmd #is free as in free "beer". Other wise not free.
    scrot
    cozette
    pywal
    cava
    catimg
    bashburn
    nmap
    usbutils
    pciutils
    fzf
    # Write and Research
    w3m
    (import ./vim.nix)
    mdbook
    ddgr
    googler
    netsurf.browser
    newsboat
    dict
    sc-im
    # topydo  #didnt build on 32 bits i686 Linux
    tmate
    # pandoc #didnt build on 32 bits i686 Linux
    # Communicate
    aerc
     dante
     scdoc
    signal-cli
     qrencode 
    # Media
    cmus
    beets
    sox
    lame
    youtube-viewer
    youtube-dl
    mplayer
    # mpv-unwrapped  #didn't build on 32 bit i686 Linux
    vlc
    feh
    fim
    imagemagick
    # Publishing Platforms
    github-cli
    rtv
      # urlscan   # Didn't build on 32 bits i686 Linux
      urlview
      urlwatch
    rainbowstream
    # Fun Stuff
    fortune
    figlet
    lolcat
 # GUI Apps or the apps that need Wayland (or X)
    firefox-bin
    qutebrowser 
    audacity
    zeal
    zathura
    #signal-desktop   # package is only for 64 bits Linux
    tdesktop
  ];
  
  
  nixpkgs.config.permittedInsecurePackages = [
          "libsixel-1.8.6"
           ];
  

  nix = {
    autoOptimiseStore = true;
  };
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?
}
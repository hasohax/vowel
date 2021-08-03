# Vowel - Very Opinionated Writing Environment for Less. A targeted command line based writing environment based on NixOS. 

{ config, pkgs,  ... }:

{ imports =
    [ # Include the results of the hardware scan. Unique to every hardware piece. Don't delete.
      ./hardware-configuration.nix
      # tmux and tmux status bar configuration.  Includes plugins.
      ./tmux/default.nix
     ];

# System boot.

  boot.loader.grub.enable = true; 
  boot.loader.grub.version = 2;		         # Good for old system. Newer ones use efi. 
  boot.loader.grub.device = "/dev/sda"; 	 # hard drive you want to install Grub.

 # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";

   console = {
    #font = "Lat2-Terminus16";                # Leave empty to allow setfont choose for you. 
     keyMap = "us";
   };

   fonts = {
     fonts = with pkgs; [ powerline-fonts dejavu_fonts ];
     fontconfig.defaultFonts = {
       monospace = [ "DejaVu Sans Mono for Powerline" ];
       sansSerif = [ "DejaVu Sans" ];
     };
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
    RTV_EDITOR = "im";
    RTV_URLVIEWER = "urlscan";
  };

# Time
  time.timeZone = "America/Los_Angeles";

# Network - Let networkmanager handle this.
  
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
 
   services.openssh.enable = true;		
   services.printing.enable = true;		 
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


# NixOS automatically creates a config file in /etc for these programs. 

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
  };


  documentation.man.enable = true;
  documentation.man.generateCaches = true;
  documentation.nixos.includeAllModules = true;

# Define a user account. Don't forget to set a password with ‘passwd’.

  users.users.amj = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "video" "sudo" ];
    shell = pkgs.bash;
  };

# automatically discover usb devices and mount them.

  services.udisks2.enable = true;   # Enable udisks2.
  services.devmon.enable = true;    # Enable external device automounting.
  boot.kernelModules = [ "fuse" ];  # ?



# Instal apps - Primarily command line; few for graphical.

  nixpkgs.config.allowUnfree = true; #For latest firefox. God knows why its unfree. 

  environment.systemPackages = with pkgs; [
 # CLI Apps or rather apps without the need of X or Wayland. 
    # System Tools / Utilities
      binutils
      coreutils
      usbutils
      iputils
      pciutils
      dnsutils
      curl
      direnv
      dosfstools
      fd
      gotop
      nix-index
      utillinux
      whois
      git
      lazygit
      neofetch
      fbterm
      man
      htop
      kbd
      xsel
      tree
      unzip
      ripgrep
      tldr
      vifm
      scrot
      cava
      catimg
      bashburn
      nmap
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
      topydo  #didnt build on 32 bits i686 Linux
      tmate
      pandoc #didnt build on 32 bits i686 Linux
      languagetool
    # Communicate
      aerc
       dante
       scdoc
       khard
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
      mpv-unwrapped  #didn't build on 32 bit i686 Linux
      vlc
      feh
      fim
      imagemagick
      faac
      faad2
      fftw
      flac
      libsamplerate
      libsndfile
      lv2
      mikmod
      mpg123
      swh_lv2
      timidity
      vorbis-tools
      ecasound
    # Publishing and online storage
      github-cli
      megacmd       #is free as in free "beer". Other wise not free.
      rtv
        urlscan     #Didn't build on 32 bits i686 Linux
        urlview
        urlwatch
      # Fun Stuff
      fortune
      figlet
      lolcat
    #Infra
       google-cloud-sdk   # Not supported on 32 bits i686
 # GUI Apps or the apps that need Wayland (or X)
      firefox-bin
      qutebrowser 
      zeal
      zotero 
      # Creativity 
      audacity-gtk3
      snd
      reaper
      #ocenaudio
      drawio
      gimp
      zathura
      # Social
      cawbird
      signal-desktop   # package is only for 64 bits Linux
      tdesktop
  ];

    environment.shellAliases =
      {
        # quick cd
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        # git
        g = "git";

        # grep
        grep = "rg";
        gi = "grep -i";

        # internet ip
        myip = "dig +short myip.opendns.com @208.67.222.222 2>&1";

        # top
        top = "gotop";

        # systemd
        ctl = "systemctl";
        utl = "systemctl --user";
        ut = "systemctl --user start";
        un = "systemctl --user stop";
        jtl = "journalctl";

      };
      
# X with only Xmonad  - No Plasma, xfce or oher desktop , Uncomment these if you don' intend to use Sway (Wih Wayland.
# In my experience, sway with wayland is around the same speed but feels much better.Highly recommend with proper config.

services.xserver = {
  enable = true;
  layout = "us";
  autorun = false;
  desktopManager.xfce.enable = true;
  desktopManager.xterm.enable = false;
  xkbOptions = "ctrl:nocaps";
  displayManager.defaultSession = "xfce";
  };

  services.xserver.videoDrivers = [ "intel" ];		# To support my old dell display.  took me 3 days of back breaking to figure out though it was there in the manual. Its hard to accept that you are old :-).
  services.xserver.deviceSection = ''
     Option "DRI" "2"
     Option "TearFree" "true"
     '';


  
  nixpkgs.config.permittedInsecurePackages = [
          "libsixel-1.8.6"
          "ffmpeg-2.8.17"
           ];

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  nix = {
    autoOptimiseStore = true;
  };
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?
}

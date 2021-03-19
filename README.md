Vowel stands for a "Very Opinionated Writing Environment for Less".  It is  primarily a command line based environment intended for Technical and Tech Savvy writers. It is blazing fast - even on an old machine. There is optional `GUI` with `Wayland Sway`. I find it better than `X org` graphical interface that most Linux distros offer. The graphical interface is lot slower compared to newer machines and of course v/s command line interface.

The repo has two branches - One (the master) for the config (OS and the apps), I use on my 32 bit Dell laptop and another (x86-64) for my 64 bit HP Pavillion (2008). Both branches are pretty similar - only difference is few of the apps don't support 32 bits computers anymore (:-. For example on 64 bits machine I can use `urlscan` to scan urls from my `aerc` emails (or Reddit) but it is not supported on the 32 bits. So I need to use a slightly older `urlview` app. `urlscan` has slightly better interface and bunch of other enhancements. Similarly , I intend to use (not done yet) `topydo` for tracking my tasks. Unfortunately it fails to build on my 32 bits machine. Such apps are commented in the 32 bits nixOS configuration.nix. 

My goal is to progressively build the wiki (in this repo) to provide simple install and config support for the OS and apps; may be with few cheatsheets. 

Some of the things that I have been doing in this environment, on my 'age-old' Dell Inspiron 6000 are :-

 - Fontconfig support with frame buffer terminal (fbterm)
 - Fuzzy search in bash and vim (fzf)
 - Multi windows and multi-pans in multiple sessions. (tmux)
 - Write long posts or books. (vim, mdbook)
 - Vim plugins to support the writers (markdown , tabular, nerdtree to name a few) 
 - Spread sheets to keep a tab on the actions and expenses (sc-im)
 - Search and research the web. (ddgr and w3m)
 - Deep dive into the dictionaries. (dictd)
 - Keep an eye on my email. (aerc) 
 - Respond to my google voice Texts via gmail. (aerc)
 - Cloud storgae that feeds my desktop, laptop and Mac Air. (mega-cmd - free as in free beer but not a open licence but one of the best app)
 - Listen and record audio logs. And of course my library of over 5000 songs. (sox and cmus)
 - Alter or create and fetch music metadata (beets and acoustID)
 - File Browser (vifm though it is rarely used)
 - Post on Reddit. Reddit command line interface is arguably better than the new web experience. (rtv)
 - Get the best out of Github (gh)
 - Check out pics in pretty good resolution - as good as GUI based systems. (fim)
 - Watch videos if I need to.. very rare for me (mplayer)
 - Catch up with daily news. (newsboat)
 - There is a signal command line interface for the chat lovers but I had hard time building it on 32 bits machine. I am anyway not much into continuous chatter.
 - And ton of other utilities and fun stuff. 

Last time I fired up the GUI ( with Sway on Wayland) was to do my taxes though I am sure there is a command line app for that :-) but I didn't wanna spend time on a thing that I hate. Plus it is just once an year pain. BTW - if you have a smart phone , you will probably love this. You will feel that laptop is lot different than your iPhone. One of the reason I don't open the lid of my Mac Air -  it feels more and more like iOS. 

# Installation
- Any Linux distro will do with above said apps if you are willing to invest time to install and configure these apps (and possibly many more). I prefer NixOS for a simple reason - it allows me to configure the entire system in few files - as if I was configuring another app. You don't need to know "nix" language to use or configure NixOS. I don't ..
- Normally NixOS configuration files are kept in folder `/etc/nixos` while for most other apps you keep the config in your home folder in say `~/.config` . If you are planning on NixOS, try the current version 20.09.  If you need help to install, I am planning to publish the instruction on the wiki in  this repo that will cover the nixos installation and configuration of the key apps such as tmux, vim and w3m etc.
- You can run `lscpu` on Linux to find if your machine is 32 bits or 64 bits. I am sure you have ways to figure out if you are currently running windows though most probably it is a 64 bits machine. If you are a old Mac guy and willing to take a dip, I am planning  to do the same with my Mac Air .. Feel free to reach out. There is a Nix Darwin project to set up the nix package manager on Mac to give a kinda same-ish feel as NixOS. I tried it but it felt like a bandage to the broken Mac. 
- So I guess , its simple .. just clone the repo and track the branch you wanna use. Copy  the nixos configuration folder in `/etc/nixos` and run `sudo nixos-rebuild switch`. ** Please ensure you don't change your `harware-configuration.nix`. This is a file that nixOS created during installation after scanning your system. This file is unique to your system**
- On a 32 bit machine, it might run for days because sadly NixOS guys don't keep 32 bit binaries in cache which means every application needs to be built on your machine from the souce code. 64 bits machines will build super fast with the entire OS configured and apps installed. You might comment out the GUI apps (sway, firefox, zeal, zathura etc) on 32 bits machine if you wanna save time in initial build. You can always uncomment them later and rebuild nixos. 
- For applications configuration, copy  the contents of `config` folder in your home (~/.config) folder. I recommend copying the applications configuration selectively - that is check the files , understand and build your own configuration. If you are copying without much thought,  back up your existing configurations particularly if you are already on NixOS. Though Nixos allows you to roll back its own config but it wont restore data in home folder to a previous state. Which means your `.config` folder will remain untouched by nixos rollback. 
- Read the book and keep tweaking till you find your perfect `writing environment` FOR less :-) 

# DevOS
Github is full of nixos configurations. One of the project that I learned a lot is `divnix/devos`. It is a full blown `flake` and `home-manager` to automate the entire dot file management for all your devices and possibly thousands of them if you are rolling out nixOS in an enterprise. Besides that `flake` is still experimental, it felt like an overkill to me but I might get to it as I learn little bit of `nix language`. Project itself is early stages. Do pay a visit. 
..

 Vowel stands for a "Very Opinionated Writing Environment for Less".  It is a primarily command line based applications that a writer needs to have a fun filled writing environment. Even on a very old machine. Some of the things that I have been doing on my Dell Inspiron 6000  with this environment are - 

 - Write long posts or books. (vim, mdbook)
 - Search and research the web. (ddgr and w3m)
 - Deep dive into the dictionaries. (dictd)
 - Keep an eye on my gmail.(aerc) 
 - Respond to Texts (via gmail). 
 - Listen and record audio logs. And of course my library of over 5000 songs. (sox and cmus)
 - Alter or create music metadata (beets)
 - File Browser (vifm)
 - Post on Reddit. Reddit command line interface is arguably better than the new web experience. (rtv)
 - Get the best out of Github (gh)
 - Check out pics in pretty good resolution - as good as GUI based systems. (fim)
 - Watch videos of I need to.(mplayer)
 - Multi windows and multi-pans. (tmux)
 - Catch up with daily news. (newsboat)

Last time I fired up the GUI ( with Sway on Wayland) was to do my taxes though I am sure there is a command line app for that :-) but I didn't wanna spend time on a thing that I hate to do even though it is just once an year. BTW - if you have a smart phone , you will probably love this. You will feel that laptop is lot different than your iPhone. One of the reason I don't open the lid of my Mac Air cause it feels more and more like iOS. 

# Installation
- Any Linux distro will do with above said apps if you are willing to explore and invest time. I prefer NixOS for a simple reason - it allows me to configure the entire system in few files - just like any other app. Only difference is you need to keep NixOS configuration files in a director /etc/nixos while for most other apps you keep the config in your home folder in say .config folder. You don't need to know "Nix" language to use NixOS. If you are planning on test driving NixOS, try the current version 20.09.  If you need help to install , I am planning to publish the book in this repo. 
- The repo has two branches - One for config (os and the apps), I use on my 32 bit dell laptop and another for my 64 bit HP Pavillion (2008). Both are pretty similar - only difference is few of the apps don't support 32 bits. For example on 64 bits machine I can use urlscan to scan urls from my aerc emails (or Reddit) but it is not supported on the 32 bits. So I need to use a slightly older urlview app. urlscan has slightly better interface and bunch of other enhancements. Similarly , I intend to use (not done yet) topydo for tracking my tasks. Unfortunately it fails on the 32 bits machine. You can run `lscpu` on Linux to find if your machine is 32 bits or 64 bits. I am sure you have ways to figure out if you are currently running windows. If you are a old Mac guy and willing to take a dip, I am planning  to do the same with my Mac Air .. feel free to reach out. 
- So I guess , its simple .. just clone the repo and track the branch you wanna use. Drop the nixos configuration folder in /etc/nixos and run `sudo nixos-rebuild switch` . 
- Drop the .config folder in your home (~) folder. 
- Make sure to back up your existing configurations if you are already on NixOS. 
- Read the book and keep tweaking till you find your perfect `writing environment` FOR less :-) 

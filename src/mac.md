# If you must use a Mac

No doubt some of us are hooked to their Macs. It is beautiful design and offeres the best of both the worlds. Running command line apps for text and sound, even on an old Mac is a powerful way to both save and enjoy the Apple Design. Here are the things I did to set up my 2012 Macbook Air  .. 

- Install Graphical Apps - Audacity ,  Spotify, Gimp , Drawio (https://github.com/jgraph/drawio-desktop/releases/tag/v14.9.6)
     - Garageband doesn't work on Anything less than Big Sur. At least not from the app store. 
     - Audacity is useful when you are too lazy to work the `ecasound` for mixing and editing. 
     - Spotify is great music app and it can be controlled from commandline with `Shpotify`. 
     - Gimp is obviously the best photo editor and draw IO is lot better than Visio particularly since both of them are free. 
- Install megacmd for Mac from mega site. It is strange that despite being a cli app it can't be installed from homebrew or nix. Even you need to run it like a graphical app from the "Applications" or "Spotlight'. It opens its own terminal for sync. Even with all this mega-cmd remains my top pick for online storage and sync. The command line tools of mega-cmd, particularly the `sync` is just awesome. 
- Install `homebrew` . Though nix package manager has most the mac cli apps but there are few things that are still missing. For example - `ecasound`. I even like to install vim throgh `homebrew` because I need vim even to play with the nix configuration file. And if you wanna powercharge your terminal with all the things that Mac offers , brew up `iTerm2`. It has supergood integration with shell and tmux. If you love Mac, you will find `iTerm` almost like a native Apple App. With `iTerm and
    vim` installed, you are ready to explore the wonderful world of terminal.
- Curl install `Oh my zsh`. It is wonderful framework for `zsh`. And it has very nice plug in for `fzf` - the fuzzy search. 
- So you see that taming the Mac terminal is not as straight forward as with the nixos. But that is a little price to pay if you want the best gui and best terminal experience. 
- So now is the time to install nix package manager. Nix is available on most of Linux distros as well as mac as a package manager - think `homebrew` or `macports`. While these two are specifically for the mac , nix is kinda universal  --> which makes it a useful tool to explore. 
- After you install `nix` on the mac, you will see that you can install most of the packages but it doesnt't give you declarative capabilities - means you can't create a config file to define all the things you need  - as you do in `nixos`. 
- If you wanna create a decalartive configuration file - the real usp of nix - then you will need to install the `darwin` project.   check out https://github.com/LnL7/nix-darwin
- With nix and darwin installed, you may copy the configuration file in this repo (/mac) to your ~/nixpkgs and run `darwin-rebuild switch`. Boom , nix will download all the packages in on big shot and you are ready to roll with Vowel. 


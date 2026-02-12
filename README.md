This is my Nix configuration in the OCF. It is a mac-OS themed desktop with topbar, dock, and Apple-styled app icons. 

These files are located in the `home-manager` directory under `~/remote` for my OCF user directory. 

The following code snippets is in the `.desktoprc` file in `~/remote`, which runs every time I log on to an OCF computer.
```
#!/bin/bash

rm -rf ~/.gtkrc-2.0 ~/.config/gtk-3.0 ~/.config/gtk-4.0

export NIXPKGS_ALLOW_UNFREE=1
nix run home-manager -- switch --flake ~/remote/home-manager --impure -b backup

bash ~/.local/share/plasma-manager/run_all.sh
```

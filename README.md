# Dots

## What do I use?

- Window Manager: Hyprland
- Status Bar: Waybar
- Terminal Emulator: Alacritty (recently switched from kitty)
- Clipbard Manager: Clipse
- Fetch: Fastfetch/[Pokefetch](./.config/my-scripts/pokefetch.sh)
- Shell: Fish (might switch to zsh soon, the non POSIX compliance is annoying at times)
- Shell Promp: Starship
- Text editor: Neovim
- File Manager: nnn
- Program Menu or whatever it's called: Rofi

My wallpapers can be found [here](https://github.com/Majestic9169/wallpapers) (there are a lot)

## Installation/Use

On a fresh arch/artix linux install, or any os really

1. (if arch based) setup yay, could do this manually or just run the [yay-setup.sh](./.config/my-scripts/yay-setup.sh) script
1. Install the necessary packages from the package lists in [my-lists](/.config/my-lists/). You can do this with 
    ```sh
    pacman -S - < pacman-pkg-list.txt
    yay -S - < yay-pkg-list.txt
    ```
1. Once you have your packages, you need their configs to be in the right place, for that first delete/move your old `.config` directory, then create a symlink from this one to the new one
    ```sh
    mv ~/.config/ ~/.config.bak # or you can do rm -rf ~/.config
    ln -s ~/dots/.config ~/.config
    ```
1. Next deal with your errors as they come up, check out the scripts in [my-scripts](./.config/my-scripts/), you will probably need to run a few of them

Check out hyprland keybinds [here](./.config/hypr/keybinds_hint.sh), that will definitely be useful

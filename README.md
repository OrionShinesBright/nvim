# Neovim Configuration
This is the setup I have arrived at for neovim, after.. not that long actually lol. This is still a very immature setup, and does many things wrong, and I am ok with that. Will continue to try and make it better.

# Installation
> [!warning] Non-Standard Organization
> This entire setup is that of a control freak. It downloads the tarball for neovim (nightly, for now, since I'm using some 0.12 features), and extracts it straight into the ~/.config/nvim directory. It installs all plugins manually or through a shell-script (very smol, I have it configured in this repo), and puts them directly into the aforemention directory. Almost all paths are controlled from lua/core.
## Backup
If you you have an existing nvim setup, you may want to back that stuff up:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
rm ~/.cache/nvim
```

## Setup - Phase 1 (Cloning Repository)
You may follow these steps, to get to a desireable, and workable state:

```bash
[[ -d ~/.config ]] || mkdir ~/.config
git clone --depth=1 https://github.com/OrionShinesBright/Neovim-For-CS.git ~/.config/nvim
```

## Setup - Phase 2 (Installing Neovim)
This is done through a script provided in this repo. Make sure to be connected to the internet in this phase.

```bash
cd ~/.config/nvim/extras/
chmod +755 setup.sh
./setup.sh
# If all of the above commands worked, then do this as well
echo "alias nvim='NVIM_APPNAME=nvim /home/orion/.config/nvim/nvim-linux-x86_64/bin/nvim'" >> ~/.bashrc
```

## Setup - Phase 3 
WORK-IN-PROGRESS

# Owen's n1-nvim 

## Install:
```
git clone -b owen-nvim git@github.com:AlgorexHealth/n1-nvim.git
./n1-nvim/install.sh
```

## Requirements: 
NVIM >= 0.8.0
Upgrading NVIM:
```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage ~/.local/bin/nvim
# modify to move to /usr/local/bin/nvim depending on machine settings
```

## What's Different:
This config uses VimPlug (by the notorius junegunn).
The config is simply a single init.vim file that contains everything.
Includes plugins for vim-terminal, nerdtree, and codium by default.

## Making changes:
To add plugins, open the ~/.config/nvim/init.vim file and add plugins. Be sure to run PlugInstall to run the installation.
To change colorscheme, modify the :colorscheme command in the init.vim file.

## Sources:
- https://github.com/NeuralNine/config-files/blob/master/init.vim


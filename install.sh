#!/bin/bash

# installing latest version of nvim
echo "installing latest version of nvim..."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p ~/.local/bin
sudo mv nvim.appimage ~/.local/bin/nvim

# install vim-plug
echo "Installing vim-plug..."
sh -c 'curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# check if nvim init file exists
if [ ! -f ~/.config/nvim/init.vim ]; then
	echo "Creating nvim init file..."
	mkdir -p ~/.config/nvim/plugin
	cp init.vim ~/.config/nvim/init.vim
else
	echo "init.vim file already exists, would you like to overwrite it? (y/n)"
	read answer
	if [ "$answer" == "y" ]; then
		rm ~/.config/nvim/init.vim
		cp init.vim ~/.config/nvim/init.vim
	fi
fi

echo "Adding nvim alias to bash_profile..."
sed -i 's/alias nvim=~\/.local\/bin\/nvim//g' ~/.bash_profile && echo "alias nvim=~/.local/bin/nvim" >> ~/.bash_profile
sed -i 's/alias n=~\/.local\/bin\/nvim//g' ~/.bash_profile && echo "alias n=~/.local/bin/nvim" >> ~/.bash_profile
sed -i 's/alias vim=~\/.local\/bin\/nvim//g' ~/.bash_profile && echo "alias vim=~/.local/bin/nvim" >> ~/.bash_profile
source ~/.bash_profile

# pip install vim interface for terminal
echo "Installing vim interface for terminal..."
pip3 install --user pynvim > /dev/null

# install nvim plugins
echo "Installing nvim plugins..."
nvim -c 'PlugInstall' -c q -c q > /dev/null


#tmux stuff
echo "Setting up tmux..."
cp tmux.conf ~/.tmux.conf
cp tmux ~/.local/bin/tmux
sed -i 's/alias tmux=~\/.local\/bin\/tmux//g' ~/.bash_profile && echo "alias tmux=~/.local/bin/tmux" >> ~/.bash_profile


# give option y/n to login to codeium
echo "Would you like to login to Codeium? (y/n)"
read answer
if [ "$answer" == "y" ]; then
	# login to Codeium
	~/.local/bin/nvim -c 'Codeium Auth'
fi


echo "nvim install complete!"



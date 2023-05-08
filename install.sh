#!/bin/bash

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


# give option to alias nvim
echo "Would you like to alias nvim? (y/n)"
read answer
if [ "$answer" == "y" ]; then
	# add nvim alias n to bash_profile
	echo "Adding nvim alias n to bash_profile..."
	sed -i 's/alias n=nvim//g' ~/.bash_profile && echo "alias n=nvim" >> ~/.bash_profile
	sed -i 's/alias vim=nvim//g' ~/.bash_profile && echo "alias vim=nvim" >> ~/.bash_profile
fi

# pip install vim interface for terminal
echo "Installing vim interface for terminal..."
pip3 install --user pynvim > /dev/null

# install nvim plugins
echo "Installing nvim plugins..."
nvim -c 'PlugInstall' -c q -c q > /dev/null

# give option y/n to login to codeium
echo "Would you like to login to Codeium? (y/n)"
read answer
if [ "$answer" == "y" ]; then
	# login to Codeium
	nvim -c 'Codeium Auth'
fi

echo "nvim install complete!"


#!/bin/bash
# install tmux from source
VERSION=3.4
curl -L https://github.com/tmux/tmux/archive/refs/tags/${VERSION}.tar.gz --output tmux-${VERSION}.tar.gz
tar xvf tmux-${VERSION}.tar.gz
cd tmux-${VERSION}
./autogen.sh
./configure 
make
sudo make install
mv tmux ~/.local/bin/tmux-3.4
cd ..
rm -rf tmux-${VERSION}
rm tmux-${VERSION}.tar.gz



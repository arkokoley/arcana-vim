sudo apt-get install git vim vim-gnome cmake exuberant-ctags

echo "#### Installing Special Fonts ####"
git clone https://github.com/Lokaltog/powerline-fonts --depth=1
cd powerline-fonts
sh install.sh
cd .. && rm powerline-fonts -r -f

echo "#### Cloning plugin Manager for Arcana-vim ####"
[[ -f $HOME/.vim/bundle/ ]] && mkdir $HOME/.vim/bundle
[[ -f $HOME/.vim/bundle/Vundle.vim ]] && rm Vundle.vim -r
git clone https://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim

echo "#### Settting up Arcana ####"
[[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc-old
cp vimrc $HOME/.arcana-vim/vimrc
ln -s $HOME/.arcana-vim/vimrc $HOME/.vimrc

echo "#### Settting up dependencies ####"
vim +PluginInstall

cd $HOME/.vim/bundle/vimproc.vim/
make
cd $PWD

echo "#### Done! ####"

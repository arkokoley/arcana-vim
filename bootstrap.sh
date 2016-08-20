sudo apt-get install git vim vim-gnome cmake exuberant-ctags\
  vim-gtk python-dev build-essential

echo "#### Installing Special Fonts ####"
git clone https://github.com/Lokaltog/powerline-fonts --depth=1
cd powerline-fonts
sh install.sh
cd .. && rm powerline-fonts -r -f

echo "#### Cloning plugin Manager for Arcana-vim ####"
url -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "#### Settting up Arcana ####"
[[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc-old
mkdir $HOME/.arcana-vim/
cp * $HOME/.arcana-vim/.
ln -s $HOME/.arcana-vim/vimrc $HOME/.vimrc

echo "#### Settting up dependencies ####"
vim +PlugInstall +qall

cd $PWD

echo "#### Done! ####"

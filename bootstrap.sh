sudo apt-get install git vim vim-gnome cmake exuberant-ctags\
  vim-gtk python-dev build-essential

echo "\n #### Installing Special Fonts ####"
if [ $(fc-list | grep -i "powerline" | wc -l) -gt 0 ]; then
  echo "\n #### Already Installed. Moving On. ####"
else 
  git clone https://github.com/Lokaltog/powerline-fonts --depth=1
  cd powerline-fonts
  sh install.sh
  cd .. && rm powerline-fonts -r -f
fi

echo "\n #### Cloning plugin Manager for Arcana-vim ####"
url -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "\n #### Settting up Arcana ####"
[[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc-old
mkdir $HOME/.arcana-vim/
cp * $HOME/.arcana-vim/.
ln -s $HOME/.arcana-vim/vimrc $HOME/.vimrc

echo "\n #### Settting up dependencies ####"
vim +PlugInstall +qall

cd $PWD

echo "\n #### Done! ####"

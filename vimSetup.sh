## Vundle requires git and curl
aptitude install git curl
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall #install vundle plugins
mkdir -p ~/.vim/colors && cp ./Tomorrow-Night.vim ~/.vim/colors/Tomorrow-Night.vim

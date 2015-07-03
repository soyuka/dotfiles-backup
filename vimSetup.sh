## Vundle requires git and curl
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/colors && cp ./Tomorrow-Night.vim ~/.vim/colors/Tomorrow-Night.vim
[ ! -f ~/.vimrc ] && cp .vimrc ~/.vimrc || echo "vimrc already available"
git clone https://github.com/Valloric/YouCompleteMe ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
echo "Execute bash install.sh"
exit 0

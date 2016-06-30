git clone https://github.com/vim/vim --depth 1
cd vim
git checkout $(git describe --abbrev=0 --tags)
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-perlinterp --enable-luainterp --with-luajit --enable-fail-if-missing --enable-cscope
# ./configure --with-features=huge \
#             --enable-multibyte \
#             --enable-rubyinterp \
#             --enable-pythoninterp \
#             --with-python-config-dir=/usr/lib/python2.7/config \
#             --enable-perlinterp \
#             --enable-luainterp \
#             --enable-cscope
make
sudo make install
## Vundle requires git and curl
git clone https://github.com/Shougo/vimproc.vim.git ~/.vim/bundle/vimproc.vim
cd ~/.vim/bundle/vimproc.vim
make
cd
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/colors && cp ./Tomorrow-Night.vim ~/.vim/colors/Tomorrow-Night.vim
[ ! -f ~/.vimrc ] && cp .vimrc ~/.vimrc || echo "vimrc already available"

git clone --depth=1 http://github.com/vim/vim
cd vim
./configure --with-x --enable-python3interp --enable-pythoninterp --enable-rubyinterp --enable-luainterp
make
sudo make install

git clone https://github.com/rupa/z
cd z && make
cd ..
cp .zshrc ~/.zshrc
mkdir -p ~/.config/zsh/ 
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh
mv antigen.zsh ~/.config/zsh/antigen.zsh
cp ./zsh/* ~/.config/zsh/
source ~/.zshrc

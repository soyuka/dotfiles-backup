cp .zshrc ~/.zshrc
mkdir -p ~/.config/zsh/ 
curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > antigen.zsh
mv antigen.zsh ~/.config/zsh/antigen.zsh
cp ./zsh/* ~/.config/zsh/
source ~/.zshrc

#!/bin/bash
H=~pi
apt update
apt install -y zsh
# sudo -u pi chsh -s $(which zsh)
apt install -y zsh-syntax-highlighting
# echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions $H/.zsh/zsh-autosuggestions
# echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $H/powerlevel10k
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
cp CascadiaCode /usr/share/fonts/truetype -r
cp MesloLG /usr/share/fonts/truetype -r
cp -rT zsh/. $H
fc-cache -vf /usr/share/fonts/
if [[ $SHELL != $(which zsh) ]]
then
    chsh -s $(which zsh) pi
fi
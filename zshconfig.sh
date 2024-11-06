#!/bin/bash
apt update
apt install -y zsh
sudo -u pi chsh -s $(which zsh)
apt install -y zsh-syntax-highlighting
# echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
# echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
cp CascadiaCode /usr/share/fonts/truetype -r
cp MesloLG /usr/share/fonts/truetype -r
fc-cache -vf /usr/share/fonts/
cp -rT zsh/. ~/
sudo apt-get install build-essential httpie jq python python-dev ruby ruby-dev git i3 slim tmux liblua5.2-dev rxvt-unicode-256color arandr pavucontrol firmware-linux-nonfree broadcom-sta-dkms firmware-iwlwifi firmware-realtek xserver-xorg firefox-esr zsh solaar network-manager-gnome flashplugin-nonfree xbacklight xautolock python3-dev iwconfig rfkill xclip rofi
sudo systemctl enable NetworkManager

# git clone --depth 1 https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git
# cd linux-firmware/
# ls
# ls /lib/firmware/
# sudo cp iwlwifi-7265*.ucode /lib/firmware/

git clone https://github.com/soyuka/dotfiles
cd dotfiles/
git checkout hp
cp .xsession ..
cp .Xresources ..
cp .Xmodmap ..
cd ..
cp -r dotfiles/i3/ .config/
cp -r dotfiles/i3status/ .config/
# sudo reboot

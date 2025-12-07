#!/usr/bin/env bash
if [ -d /home/$USER/.config/nvim/nvim-linux-x86_64 ]; then
	dialog --yesno "Do you really wish to overwrite you old neovim folder?" 0 0
	if [ $? == 1 ]; then
		echo "we're exiting........"
		exit
	fi
	echo "removing old folder in 3 seconds.."
	sleep 1; echo 3
	sleep 1; echo 2
	sleep 1; echo 1
	rm -rf /home/$USER/.config/nvim/nvim-linux-x86_64
	echo "Old Folder Gone"
fi
echo -e "\033[0;32mInstalling neovim:\033[0;0m"
sudo pacman -S --noconfirm --needed wget tar dialog
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
# echo "Put alias nvim='NVIM_APPNAME=nvim $HOME/.config/nvim/nvim-linux-x86_64/bin/nvim' into your ~/.bashrc"
dialog --yesno "Would you like to add [alias nvim='NVIM_APPNAME=nvim \$HOME/.config/nvim/nvim-linux-x86_64/bin/nvim] into your ~/.bashrc'" 0 0
if [ $? == 0 ]; then
	echo "alias nvim='NVIM_APPNAME=nvim $HOME/.config/nvim/nvim-linux-x86_64/bin/nvim'" >> $HOME/.bashrc
	echo "GREP TEST:"
	cat $HOME/.bashrc | grep "alias nvim"
fi
rm -rfi nvim-linux-x86_64.tar.gz
mv nvim-linux-x86_64 ..

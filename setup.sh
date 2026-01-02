# places all the configs into proper places
# cd ~/Dropbox/hlib/scripts/linux


## Setting up scripts shortcut 
ln -s ~/Dropbox/hlib/scripts/linux 	~/scripts
ln -s ~/Dropbox/hlib/music 			~/Music/db-music
ln -s ~/Dropbox/hlib/music_pl 		~/Music/db-music-pl
ln -s ~/.config ~/config

ln ~/scripts/.zshenv ~/

## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# SWAY configs
# 
# acpi 			- tool for battery info
# nm-applet 	- graphical tool for managing network connections 
sudo dnf install -y sway waybar wofi alacritty zsh acpi



### wofi - is a launcher
ln ~/scripts/home/.config/sway/* 			~/.config/sway/
ln ~/scripts/home/.config/sway/scripts/* 	~/.config/sway/scripts/
ln ~/scripts/home/.config/wofi/* 			~/.config/wofi/
ln ~/scripts/home/.config/waybar/* 			~/.config/waybar/

### terminal stuff
mkdir ~/bin
ln ~/scripts/home/bin/* 								~/bin/
ln ~/scripts/home/.config/alacritty/* 					~/.config/alacritty/
ln ~/scripts/home/.config/zsh/.* 						~/.config/zsh/
ln ~/scripts/home/.config/oh-my-zsh/custom/themes/* 	~/.config/oh-my-zsh/custom/themes/
# ln ~/scripts/home/.imwheelrc ~/
## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---

ln ~/scripts/home/.config/mpd/*				~/.config/mpd/
ln ~/scripts/home/.config/rmpc/* 			~/.config/rmpc/
ln ~/scripts/home/.config/rmpc/themes/* 	~/.config/rmpc/themes/

## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
## ZSH, oh-my-zsh
# oh-my-zsh: get curl install script:
# https://github.com/ohmyzsh/ohmyzsh/wiki

# changing shell
chsh -s $(which zsh)
# moving default zsh stuff under XDG_CONFIG_HOME
mkdir -p ~/.config/zsh/
mv ~/.zsh*  ~/.config/zsh/

touch ~/.zshenv
echo 'ZDOTDIR="${XDG_CONFIG_HOME}/zsh"' >> ~/.zshenv
echo 'source $XDG_CONFIG_HOME/zsh/.akomis.zsh' >> $XDG_CONFIG_HOME/zsh/.zshrc
## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---



## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
## NVIM
ln -s ~/scripts/home/.config/nvim/akomis-nvim.lua ~/.config/nvim/lua
# TODO append include
## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---


# adding links for custom scripts
ln -s ./usr_local_bin/* /usr/local/bin




## ZSH

# init_zshrc(){
# 	FILE='~/.zshrc'
# 	ln ~/scripts/home/.akomis.zshrc ~/.akomis.zshrc
# 	if [ -f $FILE ]; then
# 		echo "this is a new line" >> file.txt
# 	   	echo "File $FILE exists."
# 	else
# 	   echo "File $FILE does not exist."
# 	fi
# }


## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
### pipewire

sudo dnf install -y pipewire pipewire-audio pipewire-alsa pipewire-pulse pipewire-config-raop pipewire-pulseaudio pipewire-utils pipewire-gstreamer pavucontrol wireplumber qpwgraph

# stop pulseaudio.service
# start pipewire-pulse.service

# https://wiki.archlinux.org/title/PipeWire#Troubleshooting
## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---


## COOL RUST UTILS
cargo install exa
cargo install bat
cargo install bottom  # to use - btm
cargo install procs
cargo install zoxide
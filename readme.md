## Fresh system setup
```bash


# ARCH - install basic packages
## sublime text
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && \
	sudo pacman-key --add sublimehq-pub.gpg && \
	sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

### installing YAY
# base-devel - req for yay
sudo pacman -Syu firefox git neovim \
	eza bat bottom procs zoxide \
	base-devel \

cd ~/repos && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si


yay -S zen-browser-bin

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.keepassxc.KeePassXC

# dropbox - manually
# viber
wget -P ~/.local/bin https://download.cdn.viber.com/desktop/Linux/viber.AppImage
# telegram


## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
## ZSH, oh-my-zsh
# oh-my-zsh: get curl install script:
# https://github.com/ohmyzsh/ohmyzsh/wiki

# changing shell
chsh -s $(which zsh)
mkdir -p ~/.config/zsh/
mv ~/.zsh*  ~/.config/zsh/

### --- --- --- --- --- --- --- --- --- ---

git clone https://github.com/akomis-e/config ~/repos/akomis-e/config
git config --global user.email "greyakomis@gmail.com"
git config --global user.name "akomis"

sudo sh -c "echo LC_TIME='\"'en_GB.UTF-8'\"'" >> /etc/locale.conf


## Setting up scripts shortcuts
ln -s ~/repos/akomis-e/config 		~/scripts


###
ln -s ~/Dropbox/hlib/music 			~/Music/db-music
ln -s ~/Dropbox/hlib/music_pl 		~/Music/db-music-pl
ln -s ~/.config ~/config

ln ~/scripts/.zshenv ~/



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
ln ~/scripts/home/.config/nvim/* 			~/.config/nvim/lua






## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
## NVIM


## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---








# ## --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
# # FEDORA
# # 
# # acpi 			- tool for battery info
# # nm-applet 	- graphical tool for managing network connections 
# sudo dnf install -y sway waybar wofi alacritty zsh acpi

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
```
## Fresh system setup
```bash

sudo sh -c "echo LC_TIME='\"'en_GB.UTF-8'\"'" >> /etc/locale.conf

# ARCH - install basic packages
### sublime text
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && \
	sudo pacman-key --add sublimehq-pub.gpg && \
	sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

### core utils
# base-devel 		- req for yay
# acpi				- to fetch battery info
# man-db			- for some reason arch I tried didn't have it
### sway
# dunst, libnotify 	- for notifications
# libappindicator 	- tray icons support
# wofi				- menu to run stuff, tool for custom scripts
# dolphin			- file manager
### console stuff
#   git neovim alacritty zsh
# 	lf ueberzug graphicsmagick ghostscript
# 	eza bat bottom procs zoxide ueberzugpp
### utils for different file types, yazi file manager optional dependencies
# 	7zip jq fd ffmpeg poppler ripgrep fzf resvg wl-clipboard chafa imagemagick yazi
### music player setup
# 	mpd rmpc cava
### other apps
sudo pacman -Syu \
	base-devel acpi man-db \
	lemurs dunst libnotify libappindicator wofi dolphin\
	git neovim alacritty zsh \
	lf ueberzug graphicsmagick ghostscript \
	eza bat bottom procs zoxide ueberzugpp \
	7zip jq fd ffmpeg poppler ripgrep fzf resvg wl-clipboard chafa imagemagick yazi \
	mpd rmpc cava \
	qbittorrent flatpak firefox telegram-desktop discord 


### YAY	
git clone https://aur.archlinux.org/yay-bin.git ~/repos/yay-bin && \
	cd ~/repos/yay-bin && makepkg -si && cd ~
### My dot files
git clone https://github.com/akomis-e/config ~/repos/akomis-e/config
### Lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim


### --- --- --- --- --- --- --- --- --- --- ---
### changing loging/display manager to: lemurs
sudo systemctl disable lightdm.service
sudo systemctl enable lemurs.service
cat << EOF | sudo tee /etc/lemurs/wayland/sway 
#! /bin/sh
exec sway
EOF
sudo chmod 755 /etc/lemurs/wayland/sway
sudo mv /etc/lemurs/config.toml /etc/lemurs/config.toml.backup
sudo cp 
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### common apps
yay -S zen-browser-bin dropbox auto-cpufreq
flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.keepassxc.KeePassXC
### battery performance tool:
sudo auto-cpufreq --install
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### FONTS
sudo pacman -Syu \
	cantarell-fonts \
	adobe-source-han-sans-otc-fonts \
	adobe-source-han-serif-otc-fonts \
	noto-fonts \
	noto-fonts-cjk \
	ttf-font-awesome \
	ttf-dejavu ttf-liberation ttf-droid ttf-ubuntu-font-family
yay -S noto-fonts-tc ttf-tw ttf-caladea ttf-carlito
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### sublime text setup: 
# 1) install package control, then sync-settings plugin
# 2) open settings file, add: 	{"access_token": "...", "gist_id": "...",}
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### setting terminal
chsh -s $(which zsh)
### oh-my-zsh -- https://github.com/ohmyzsh/ohmyzsh/wiki
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### setting .config files
ln -s ~/repos/akomis-e/config 		~/scripts
ln -s ~/.config 					~/config
mkdir -p \
	~/bin \
	~/Music/ \
	~/.config/hardware \
	~/.config/sway/scripts \
	~/.config/wofi/ \
	~/.config/zsh/ \
	~/.config/oh-my-zsh/custom/themes/ \
	~/.config/alacritty/ \
	~/.config/waybar/ \
	~/.config/mpd/ \
	~/.config/rmpc/themes/
#  ~/.config/nvim - already created by clonning LazyLua repo there

mv ~/.zsh*  				~/.config/zsh/
mv ~/.oh-my-zsh*  			~/.config/oh-my-zsh/
rm ~/.config/zsh/.zshrc

ln ~/scripts/home/bin/*									~/bin/
ln ~/scripts/home/.zshenv 								~/
ln ~/scripts/home/.config/zsh/.* 						~/.config/zsh/
ln ~/scripts/home/.config/sway/* 						~/.config/sway/
ln ~/scripts/home/.config/sway/scripts/* 				~/.config/sway/scripts/
ln ~/scripts/home/.config/wofi/* 						~/.config/wofi/
ln ~/scripts/home/.config/waybar/* 						~/.config/waybar/
ln ~/scripts/home/.config/alacritty/* 					~/.config/alacritty/
ln ~/scripts/home/.config/oh-my-zsh/custom/themes/* 	~/.config/oh-my-zsh/custom/themes/
ln ~/scripts/home/.config/mpd/*							~/.config/mpd/
ln ~/scripts/home/.config/rmpc/* 						~/.config/rmpc/
ln ~/scripts/home/.config/rmpc/themes/* 				~/.config/rmpc/themes/

rm ~/.config/nvim/init.lua
ln ~/scripts/home/.config/nvim/init.lua					~/.config/nvim/init.lua
ln ~/scripts/home/.config/nvim/lua/plugins/*			~/.config/nvim/lua/plugins/
### --- --- --- --- --- --- --- --- --- --- ---

### --- --- --- --- --- --- --- --- --- --- ---
# TODO: setup hardware config in ~/.config/hardware
#    using scripts from ~/scripts/home/hardware
# ~/scripts/home/.config/hardware/lenovo-14AKP10.sh
### --- --- --- --- --- --- --- --- --- --- ---

### --- --- --- --- --- --- --- --- --- --- ---
# TODO: 
# login to google accs, dropbox(set proper sync), viber, telegram, etc...
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- ---
### setting up personal files
ln -s ~/Dropbox/hlib/music 			~/Music/library
ln -s ~/Dropbox/hlib/music_pl 		~/Music/playlists
### TODO copy pictures, videos from usb
### --- --- --- --- --- --- --- --- --- --- ---

### --- --- --- --- --- --- --- --- --- --- ---
### Git config
git config --global user.email "greyakomis@gmail.com"
git config --global user.name "akomis"

git config --global alias.pullff pull --ff
git config --global alias.co     checkout
git config --global alias.cod    !git checkout origin/develop && git branch -f develop && git checkout develop
git config --global alias.com    !git checkout origin/master && git branch -f master && git checkout master
git config --global alias.coma   !git checkout origin/main && git branch -f main && git checkout main
git config --global alias.loga   "log --oneline --graph --pretty=format:\"%C(#774477)%h %C(#555555)%ar %C(#aaaaaa)%s %C(auto)%d%C(#555555)/ %an\""
git config --global alias.logg   "log -n 20 --oneline --pretty=format:\"%C(#774477)%h %C(#555555)%ar %C(#aaaaaa)%s %C(auto)%d%C(#555555)/ %an\""
git config --global alias.dc     diff --cached
git config --global alias.cob    checkout -b
git config --global alias.ba     branch -adiffc = diff --cached
### --- --- --- --- --- --- --- --- --- --- ---










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
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
# lemurs			- login manager
# impala			- wifi util
# handlers			- tool for setting mime type bindings
### sway
# dunst, libnotify 	- for notifications
# libappindicator 	- tray icons support
# wofi				- menu to run stuff, tool for custom scripts
###
# cosmic-files 		- file manager
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
	base-devel acpi man-db lemurs\
	impala handlr \
 	dunst libnotify libappindicator wofi xdg-desktop-portal \
	cosmic-files \
	git ghostty zsh neovim \
	ueberzug graphicsmagick ghostscript \
	eza bat bottom procs zoxide ueberzugpp \
	7zip jq fd ffmpeg poppler ripgrep fzf resvg wl-clipboard chafa imagemagick yazi \
	mpd rmpc cava \
	gpicview mpv\
	qbittorrent flatpak firefox telegram-desktop discord 


### YAY	
git clone https://aur.archlinux.org/yay-bin.git ~/repos/yay-bin && \
	cd ~/repos/yay-bin && makepkg -si && cd ~
### My dot files
git clone https://github.com/akomis-e/config ~/repos/akomis-e/dotfiles

### Lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim


	# sudo pacman -S 

alias yayy="yay -Syu --noremovemake --answerclean None --answerdiff None"

### --- --- --- --- --- --- --- --- --- --- ---
### common apps
yayy -S zen-browser-bin dropbox auto-cpufreq

flatpak remote-add --user --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install --user flathub org.keepassxc.KeePassXC
### battery performance tool:
sudo auto-cpufreq --install
### --- --- --- --- --- --- --- --- --- --- ---



### --- --- --- --- --- --- --- --- --- --- ---
### Programming stuff
yayy -S scala3
ln -s /usr/bin/scala3 ~/bin/scala
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
yayy -S noto-fonts-tc ttf-tw ttf-caladea ttf-carlito
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
ln -s ~/repos/akomis-e/dotfiles 	~/dotfiles
ln -s ~/.config 					~/config
ln -s ~/dotfiles/home/bin/			~/bin
mkdir -p \
	~/bin \
	~/Music/ \
	~/.config/hardware \
	~/.config/sway/scripts \
	~/.config/wofi/ \
	~/.config/xdg-desktop-portal/ \
	~/.config/zsh/ \
	~/.config/oh-my-zsh/custom/themes/ \
	~/.config/alacritty/ \
	~/.config/waybar/ \
	~/.config/lf/ \
	~/.config/yazi/ \
	~/.config/mpd/ \
	~/.config/rmpc/themes/
#  ~/.config/nvim - already created by clonning LazyLua repo there

mv ~/.zsh*  				~/.config/zsh/
mv ~/.oh-my-zsh*  			~/.config/oh-my-zsh/
rm ~/.config/zsh/.zshrc

# ?? remove alacritty?
ln ~/dotfiles/home/.zshenv 								~/
ln ~/dotfiles/home/.config/zsh/.* 						~/.config/zsh/
ln ~/dotfiles/home/.config/sway/* 						~/.config/sway/
ln ~/dotfiles/home/.config/sway/scripts/* 				~/.config/sway/scripts/
ln ~/dotfiles/home/.config/wofi/* 						~/.config/wofi/
ln ~/dotfiles/home/.config/xdg-desktop-portal/* 		~/.config/xdg-desktop-portal/
ln ~/dotfiles/home/.config/waybar/* 					~/.config/waybar/
ln ~/dotfiles/home/.config/ghostty/* 					~/.config/ghostty/
ln ~/dotfiles/home/.config/alacritty/* 					~/.config/alacritty/
ln ~/dotfiles/home/.config/oh-my-zsh/custom/themes/* 	~/.config/oh-my-zsh/custom/themes/
ln ~/dotfiles/home/.config/lf/*							~/.config/lf/
ln ~/dotfiles/home/.config/yazi/*						~/.config/yazi/
ln ~/dotfiles/home/.config/mpd/*						~/.config/mpd/
ln ~/dotfiles/home/.config/rmpc/* 						~/.config/rmpc/
ln ~/dotfiles/home/.config/rmpc/themes/* 				~/.config/rmpc/themes/

rm ~/.config/nvim/init.lua
ln ~/dotfiles/home/.config/nvim/init.lua				~/.config/nvim/init.lua
ln ~/dotfiles/home/.config/nvim/lua/plugins/*			~/.config/nvim/lua/plugins/
### --- --- --- --- --- --- --- --- --- --- ---

### --- --- --- --- --- --- --- --- --- --- ---
### yazi config
### TODO remove yazi ???
ya pkg add bennyyip/gruvbox-dark
ya pkg add grappas/wl-clipboard
### --- --- --- --- --- --- --- --- --- --- ---





### --- --- --- --- --- --- --- --- --- --- ---
### changing loging/display manager to: lemurs
sudo systemctl disable lightdm.service
sudo systemctl enable lemurs.service
cat << EOF | sudo tee /etc/lemurs/wayland/sway 
#! /bin/sh
exec sway
EOF
sudo chmod 755 /etc/lemurs/wayland/sway
sudo mv /etc/lemurs/config.toml 					/etc/lemurs/config.toml.backup
sudo ln -s ~/dotfiles/etc/config.toml 				/etc/lemurs/config.toml
### --- --- --- --- --- --- --- --- --- --- ---
sudo mkdir -p /etc/
# sudo cp ~/dotfiles/etc/systemd/logind.conf.d/*					 	/etc/systemd/logind.conf.d/
sudo cp ~/dotfiles/etc/systemd/logind.conf.d/ignore_lid_close.conf 		/etc/systemd/logind.conf.d/
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### TODO: 
### --- --- --- --- --- --- --- --- --- --- ---



### --- --- --- --- --- --- --- --- --- --- ---
# TODO: setup hardware config in ~/.config/hardware
#    using scripts from ~/dotfiles/home/hardware
# ~/dotfiles/home/.config/hardware/lenovo-14AKP10.sh
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
git config --global core.editor nvim
git config --global user.email "greyakomis@gmail.com"
git config --global user.name "akomis"

git config --global alias.pullff pull --ff
git config --global alias.co     checkout
git config --global alias.dc     diff --cached
git config --global alias.cob    checkout -b
git config --global alias.ba     branch -a
git config --global alias.diffc  diff --cached
git config --global alias.logg   '!git log --oneline --pretty=format:'"'"'%C(#774477)%h %C(#555555)%ar %C(#aaaaaa)%s %C(auto)%d%C(#555555)/ %an'"'"''
git config --global alias.cod    '!git checkout origin/develop && git branch -f develop && git checkout develop'
git config --global alias.com    '!git checkout origin/master && git branch -f master && git checkout master'
git config --global alias.coma   '!git checkout origin/main && git branch -f main && git checkout main'
# git config --global alias.loga   "log --oneline --graph --pretty=format:\"%C(#774477)%h %C(#555555)%ar %C(#aaaaaa)%s %C(auto)%d%C(#555555)/ %an\""
### --- --- --- --- --- --- --- --- --- --- ---




### --- --- --- --- --- --- --- --- --- --- ---
### Set mime handlers
# lists of .desktop files
# 		la ~/.local/share/applications/
# 		la /usr/share/applications/
#
# list of mime<->desktop app bindings
# 		bat  ~/.config/mimeapps.list
# 		nvim ~/.config/mimeapps.list
#       bat ~/.local/share/applications/mimeapps.list

# TODO 
# to check: is .config empty by default?
ln -s ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list

handlr add inode/directory com.system76.CosmicFiles.desktop
handlr set x-scheme-handler/terminal com.mitchellh.ghostty.desktop

### --- --- --- --- --- --- --- --- --- --- ---

# Install some of these?
# https://wiki.archlinux.org/title/List_of_applications/Utilities#Archiving_and_compression_tools




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
## Fresh system setup
```bash

### --- --- --- --- --- --- --- --- --- --- ---
### dotfiles repo
### --- --- --- --- --- --- --- --- --- --- ---
mkdir 	~/repos
git clone https://github.com/akomis-e/config ~/repos/dotfiles
git clone https://codeberg.org/akomis-e/config ~/repos/dotfiles

ln -s ~/repos/akomis-e/dotfiles 	~/dotfiles
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### system config
### --- --- --- --- --- --- --- --- --- --- ---
# may be not needed on some distros
sudo sh -c "echo LC_TIME='\"'en_GB.UTF-8'\"'" >> /etc/locale.conf
### --- --- --- --- --- --- --- --- --- --- ---
# setup hardware config from dotfiles
~/dotfiles/hardware/hardware_set.sh
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### sublime text
### --- --- --- --- --- --- --- --- --- --- ---
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && \
	sudo pacman-key --add sublimehq-pub.gpg && \
	sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### core utils
### --- --- --- --- --- --- --- --- --- --- ---
# base-devel 		- req for yay
# acpi				- to fetch battery info
# man-db			- for some reason arch I tried didn't have it
# tldr				- shortens man pages to few examples
# pacman-contrib	- utils for pacman, like 'paccache -r'
# dysk				- tool to check disk usage

# lemurs			- login manager
# impala			- wifi util
# handlers			- tool for setting mime type bindings
# stow 				- gnu tool to make hard links for dotfiles
### sway setup
# dunst, libnotify 	- for notifications
# libappindicator 	- tray icons support
# wofi				- menu to run stuff, tool for custom scripts
# cosmic-files 		- file manager
# wl-clipboard
sudo pacman -Syu \
	base-devel acpi man-db tldr \
	pacman-contrib dysk \
	impala handlr stow \
	brightnessctl \
 	dunst libnotify libappindicator wofi xdg-desktop-portal \
 	wl-clipboard \
	cosmic-files \
	7zip \
	qbittorrent 

### terminal utils stuff
sudo pacman -Syu \
	git git-delta \
	ghostty zsh neovim \
	ueberzug graphicsmagick ghostscript \
	fzf jq fd eza bat bottom procs zoxide ueberzugpp ripgrep \
	yazi \

### multimedia things
# 	mpd rmpc cava  	- music player setup
#	chafa 			- cli tool to convert between formats
# 	poppler 		- pdf viewer (and for other formats too)
sudo pacman -Syu \
	mpd rmpc cava \
	ffmpeg resvg imagemagick gpicview mpv\
	chafa poppler\
	qbittorrent flatpak firefox telegram-desktop discord 
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### YAY	
### --- --- --- --- --- --- --- --- --- --- ---
git clone https://aur.archlinux.org/yay-bin.git ~/repos/yay-bin && \
	cd ~/repos/yay-bin && makepkg -si && cd ~
alias yayy="yay -Syu --noremovemake --answerclean None --answerdiff None"
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### common apps
### --- --- --- --- --- --- --- --- --- --- ---
yayy -S auto-cpufreq 
yayy -S zen-browser-bin dropbox auto-cpufreq pinta

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
yayy -S noto-fonts-tc ttf-tw ttf-caladea ttf-carlito
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### setting terminal
### --- --- --- --- --- --- --- --- --- --- ---
chsh -s $(which zsh)
### Lazyvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
### oh-my-zsh -- https://github.com/ohmyzsh/ohmyzsh/wiki

# -oh-my-zsh is already installe on cashos
# setting ZSH to alter installation path
# ZSH="$HOME/.dotfiles/oh-my-zsh" \
	# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### setting .config files
### --- --- --- --- --- --- --- --- --- --- ---
ln -s ~/repos/akomis-e/dotfiles 	~/dotfiles
ln -s ~/.config 					~/config
# ln -s ~/dotfiles/home/bin/			~/dotfiles-bin
mkdir -p \
	~/bin \
	~/Music/ \
	~/Pictures/ \
	~/Videos/
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
### Stow
### --- --- --- --- --- --- --- --- --- --- ---
# Remove conflicting files
rm  ~/.config/nvim/init.lua
### --- --- --- --- --- --- --- --- --- --- ---
# SRC: 					~/dotlifes
# TRG: 					~
# package to sync: 		home
stow -v -d ~/dotfiles/ -t ~ home
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- ---
### Login to Dropbox
### --- --- --- --- --- --- --- --- --- ---
ln -s ~/Dropbox/hlib/music 				~/Music/library
ln -s ~/Dropbox/hlib/music_pl 			~/Music/playlists
# sublime text config: 
ln -s ~/Dropbox/hlib/sublime_text/User 	~/config/sublime-text/Packages
### --- --- --- --- --- --- --- --- --- --- ---
### Copt folders (from usb, TODO: NextCloud): Pictures, Videos 
### --- --- --- --- --- --- --- --- --- --- ---


### --- --- --- --- --- --- --- --- --- --- ---
# Login to google accs, viber, telegram, etc...
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
### --- --- --- --- --- --- --- --- --- --- ---
# TODO: to check: is .config empty by default?
# ln -s ~/.config/mimeapps.list ~/.local/share/applications/mimeapps.list

# handlr add inode/directory com.system76.CosmicFiles.desktop
handlr set x-scheme-handler/terminal com.mitchellh.ghostty.desktop
### --- --- --- --- --- --- --- --- --- --- ---



### --- --- --- --- --- --- --- --- --- --- ---
### Zen Browser configs
### --- --- --- --- --- --- --- --- --- --- ---
# Add search engines
### --- --- --- --- --- --- --- --- --- --- ---
# zen.view.use-single-toolbar = false
# browser.urlbar.trimURLs = false
# zen.window-sync.enabled = false
### --- --- --- --- --- --- --- --- --- --- ---




### --- --- --- --- --- --- --- --- --- --- ---
### Programming stuff
### --- --- --- --- --- --- --- --- --- --- ---
yayy -S scala3
ln -s /usr/bin/scala3 ~/bin/scala

# scala-cli : https://scala-cli.virtuslab.org/install
curl -sSLf https://scala-cli.virtuslab.org/get | sh
ln -s /home/akomis/.cache/scalacli/local-repo/bin/scala-cli/scala-cli ~/bin/scala-cli
### --- --- --- --- --- --- --- --- --- --- ---











### --- --- --- --- --- --- --- --- --- --- ---
### --- --- --- --- --- --- --- --- --- --- ---
### DEPRECATED THINGS
### tried once, don't use it anymore
### --- --- --- --- --- --- --- --- --- --- ---
### --- --- --- --- --- --- --- --- --- --- ---



### --- --- --- --- --- --- --- --- --- --- ---
### ??? Setup login manager ???
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
# sudo mkdir -p /etc/
# sudo cp ~/dotfiles/etc/systemd/logind.conf.d/*					 	/etc/systemd/logind.conf.d/
sudo mkdir /etc/systemd/logind.conf.d
sudo cp ~/dotfiles/etc/systemd/logind.conf.d/ignore_lid_close.conf 		/etc/systemd/logind.conf.d/
### --- --- --- --- --- --- --- --- --- --- ---



### --- --- --- --- --- --- --- --- --- --- ---
### yazi config
### TODO remove yazi ???
ya pkg add bennyyip/gruvbox-dark
ya pkg add grappas/wl-clipboard
### --- --- --- --- --- --- --- --- --- --- ---

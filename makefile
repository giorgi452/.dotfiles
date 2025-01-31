all:
	stow --verbose --target=$$HOME --restow */

delete:
	stow --verbose --target=$$HOME --delete */

new:
	sudo pacman -Sy picom kitty tmux zsh dunst neovim feh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	stow --verbose --target=$$HOME --restow */
	sudo pacman -Sy nodejs npm gcc go

all:
	stow --verbose --target=$$HOME --restow */

delete:
	stow --verbose --target=$$HOME --delete */

new:
	sudo pacman -S picom polybar alacritty tmux zsh rofi dunst neovim ranger feh ueberzug
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	stow --verbose --target=$$HOME --restow */

{ config, lib, pkgs, ... }:

{
  environment.systemPackages = (with pkgs; [
	bspwm
	feh
	sxhkd
	xsettingsd
	dunst
	light
	picom
	polybarFull
	pulsemixer
	rofi
	xfce.xfce4-power-manager
	mate.atril
	galculator
	geany
	mplayer
	xfce.thunar
	xfce.thunar-archive-plugin
	xfce.thunar-media-tags-plugin
	xfce.thunar-volman
	viewnior
	htop
	ncdu
	nethogs
	ranger
	vim
	zsh
	acpi
	blueman
	ffmpegthumbnailer
	noto-fonts
	highlight
	inotify-tools
	iw
	jq
	libwebp
	libavif
	libheif
	maim
	meld
	mpc-cli
	mpd
	ncmpcpp
	neofetch
	pavucontrol
	powertop
	qt5ct
	libsForQt5.qtstyleplugin-kvantum
	simplescreenrecorder
	trash-cli
	xfce.tumbler
	wmctrl
	wmname
	xclip
	xdg-user-dirs
	xdotool
	yad
	bzip2
	gzip
	lrzip
	lz4
	lzip
	lzop
	p7zip
	rar
	gnutar
	unzip
	unrar
	xarchiver
	zip
	zstd
	libnma
	pywal
	ueberzug
	betterlockscreen  
	alacritty
	networkmanager_dmenu
	dmenu
	pastel
	lxqt.lxqt-policykit
	ksuperkey
	nerdfonts
	killall
	lxappearance
  ]);
	programs.zsh.enable = true;
    services.xserver.windowManager.bspwm.enable = true;
    services.displayManager.sddm.enable = true;
	xdg.portal.enable = true;
	xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
	xdg.portal.config.common.default = "*";
	security.polkit.enable = true;
	services.gvfs.enable = true;
	services.gnome.gnome-keyring.enable = true;
}

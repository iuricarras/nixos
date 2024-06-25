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
	killall
	lxappearance
	xorg.xbacklight
	sddm-chili-theme
	redshift
	libsForQt5.networkmanager-qt
  ]);

  services = {
    xserver.windowManager.bspwm.enable = true;
    displayManager.sddm.enable = true;
	  gvfs.enable = true;
	  gnome.gnome-keyring.enable = true;
  };
  
  xdg.portal = {
    enable = true;
	  extraPortals = [pkgs.xdg-desktop-portal-gtk];
	  config.common.default = "*";
  };

	programs.zsh.enable = true;
	security.polkit.enable = true;
	services.gvfs.enable = true;
	services.gnome.gnome-keyring.enable = true;
	security.pam.services.sddm.enableGnomeKeyring = true;
	programs.ssh.startAgent = true;
	programs.seahorse.enable = true;
	services.xserver.displayManager.setupCommands = ''
		eval $(/run/wrappers/bin/gnome-keyring-daemon --start --daemonize)
		export SSH_AUTH_SOCK
	'';
}

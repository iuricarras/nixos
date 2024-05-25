# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    layout = "pt";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "pt-latin1";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.iuricarras = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "iuricarras";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  bspwm
  feh
  sxhkd
  xsettingsd
dunst
		  light
		  picom
		  polybar
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

		  # Utilities
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

		  # Archives
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
  
		  # For networkmanager_dmenu
		  
		  libnma

		  # for Ueberzug
		  pywal
		ueberzug
		betterlockscreen  
		alacritty
		networkmanager_dmenu
		dmenu
pastel
];
  programs.zsh.enable = true;
  services.xserver.displayManager.sddm.enable = true;
services.xserver.windowManager.bspwm.enable = true;
services.xserver.enable = true; 
virtualisation.vmware.guest.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}

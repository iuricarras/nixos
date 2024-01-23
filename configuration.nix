# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  
  systemd.extraConfig = ''
  	DefaultTimeoutStopSec=10s;
  '';
  
  fileSystems."/home" =  {
    device = "/dev/disk/by-partlabel/HOME";
    fsType = "ext4";
  };
  
  fileSystems."/home/iuricarras/Games/HDD" = {
    device = "/dev/disk/by-partlabel/HDD";
    fsType = "ext4";
    options = [ "noauto" ];
  };
  
  networking.hostName = "nixos-laptop"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };  

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
  #   font = "Lat2-Terminus16";
    keyMap = "pt-latin1";
  #   useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  nixpkgs.config.allowUnfree = true;
  services.xserver.videoDrivers = ["nvidia"];
  
  # Services
  services = {
    syncthing = {
      enable = true;
      user = "iuricarras";
      dataDir = "/home/iuricarras/.syncthing";    # Default folder for new synced folders
      configDir = "/home/iuricarras/.config/syncthing";   # Folder for Syncthing's settings and keys
    };
    ratbagd.enable = true;
    flatpak.enable = true; 
    openvpn.servers = {
      serverVPN  = { config = '' config /root/nixos/openvpn/server.ovpn ''; autoStart = false; };
    }; 
  };
  
  # NVIDIA
  hardware.opengl = {
  	enable = true;
  	driSupport = true;
    driSupport32Bit = true;
  };
  
  hardware.nvidia = {
  	modesetting.enable = true;
  	powerManagement.enable = false;
  	powerManagement.finegrained = true;
  	open = false;
  	nvidiaSettings = true;
  	package = config.boot.kernelPackages.nvidiaPackages.stable;
  	prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
	  };
  }; 
  
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  
  # Configure keymap in X11
  services.xserver.xkb.layout = "pt";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  #sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
	
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.iuricarras = {
     isNormalUser = true;
     description = "Iuri Carrasqueiro";
     extraGroups = [ "wheel" "libvirtd" ]; # Enable ‘sudo’ for the user.
   };

  home-manager = {
    users = {
      "iuricarras" = import ./home.nix;
    };
  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  #services.gnome.gnome-keyring.enable = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #partition-manager
    (jetbrains.idea-ultimate.override { jdk = jdk21;})
    appimage-run
    blanket
    blender
    btop
    ciscoPacketTracer8
    cmake
    deluge-gtk
    discord
    firefox
    fuse
    gamemode
    gcc13
    gengetopt
    git 
    gnome.gnome-tweaks
    gnomeExtensions.appindicator
    gnumake
    goverlay  
    haruna
    heroic
    home-manager
    libsForQt5.kalk
    lshw
    lutris
    mangohud
    neofetch
    nextcloud-client
    openvpn
    piper
    pipx
    pkg-config
    prismlauncher
    protonup-qt
    python3
    python311Packages.pip
    python311Packages.vdf 
    spotify
    unzip
    r2modman     
    virtiofsd
    vscode
    wine
    wireshark
    wmctrl
    xarchiver
    xwaylandvideobridge
  ];

  programs.steam = {
    enable = true;
    package = with pkgs; steam.override { extraPkgs = pkgs: [ attr ]; };
  };

  #KDE Desktop Environment
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  programs.dconf.enable = true;
  #services.xserver.desktopManager.lxqt.enable = true;
  #services.xserver.displayManager.defaultSession = "lxqt";
  #services.xserver.desktopManager.xfce.enable = true;
  #services.xserver.displayManager.defaultSession = "xfce";
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.displayManager.gdm.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}


{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  boot.initrd.luks.devices = [{
    name   = "lvm";
    device = "/dev/sda2";
    preLVM = true;
  }];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # Define on which hard drive Grub is installed.
  boot.loader.grub.device = "/dev/sda";

  nixpkgs.config.allowBroken = true;

  time.timeZone = "America/Los_Angeles";

  networking.hostName = "zenbook";
  networking.networkmanager.enable = true;

  powerManagement.enable = true;

  programs.bash.enableCompletion = true;
  programs.zsh.enable = true;

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "lat9w-16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Sound
  hardware.pulseaudio.enable = true;

  # Services
  services.openssh.enable = true;
  # services.printing.enable = true;

  services.acpid.enable = true;
  services.avahi = {
    enable  = true;
    nssmdns = true;
  };
  services.locate.enable  = true;
  services.upower.enable  = true;
  services.gnome3.gvfs.enable  = true;
  services.udisks2.enable = true;

  environment = {
    variables = {
      GTK_DATA_PREFIX = "${config.system.path}";
    };

    pathsToLink = [
      "/share/xfce4"
      "/share/themes"
      "/share/mime"
      "/share/icons"
      "/share/desktop-directories"
    ];

    systemPackages = with pkgs; [
      (ruby.override { cursesSupport = true; })
    ];
  };


  services.redshift = {
    enable = true;

    latitude  = "48";
    longitude = "-122";

    temperature = {
      night = 4551;
      day   = 5200;
    };
  };

  # X and more!
  services.xserver = {
    enable  = true;
    autorun = true;
    config = ''
      Section "Monitor"
        Identifier  "<default monitor>"
        DisplaySize 294 165 # In millimeters
      EndSection
    '';

    displayManager.desktopManagerHandlesLidAndPower = false;
    displayManager.sessionCommands = ''
      nitrogen --restore &
      dropbox &
      nm-applet &
      xmodmap ~/.Xmodmap &
    '';

    displayManager.slim = {
      enable = true;
      defaultUser = "ryan";
      theme = pkgs.fetchurl {
        url    = "https://github.com/jagajaga/nixos-slim-theme/archive/Final.tar.gz";
        sha256 = "4cab5987a7f1ad3cc463780d9f1ee3fbf43603105e6a6e538e4c2147bde3ee6b";
      };
    };
    windowManager.i3.enable = true;
    desktopManager.xterm.enable = false;

    synaptics = {
      enable = true;
      twoFingerScroll = true;
      tapButtons = true;
    };
  };

  # Users
  users.extraUsers.ryan = {
    isNormalUser = true;
    home = "/home/ryan";
    description = "Ryan McGowan";
    extraGroups = ["wheel" "networkmanager"];
    shell = "/run/current-system/sw/bin/zsh";
  };
}

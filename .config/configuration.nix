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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.graphics = {
  	enable = true;
		enable32Bit = true;
  };

  networking.hostName = "hal"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.subzcuber = {
    isNormalUser = true;
    description = "Tegan";
    shell = pkgs.fish;
    useDefaultShell = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
		pw-volume
		pavucontrol
		cava
		fastfetch
		starship
		fish
		wget
		firefox-wayland
		neovim
		git
		polkit
		xdg-desktop-portal-hyprland
		dconf
		xwayland
		hyprland
		alacritty
		waybar
		pipewire
		wl-clipboard
		pywal
		swww
		rofi-wayland
		grim
		slurp
		wf-recorder
		vlc
		mpv
		github-cli
		btop
		# gcc
		yarn
		fzf
		swappy
		mesa
		vulkan-tools

		# lfs shit
		bash
		binutils
		bison
		coreutils
		diffutils
		findutils
		gawk
		gcc
		# grep
		gzip
		linux
		m4
		gnumake # make is found as gnumake
		patch
		perl
		python3
		# sed
		# tar
		texinfo
		xz
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.hyprland = {
	  enable = true;
	  xwayland.enable = true;
  };
  programs.fish.enable = true;

  fonts = {
  	  enableDefaultPackages = true;
	  	fontDir.enable = true;
	  	packages = with pkgs; [
			noto-fonts
			noto-fonts-cjk-sans
			noto-fonts-emoji
			liberation_ttf
			nerd-fonts.iosevka
	  ];

	  fontconfig = {
	  	defaultFonts = {
				serif = [ "Iosevka Nerd Font" ];
				sansSerif = [ "Iosevka Nerd Font" ];
				monospace = [ "Iosevka Nerd Font" ];
			};
	  };
  };
  	

  # List services that you want to enable:
  security.rtkit.enable = true;
  services.pipewire = {
  	enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		wireplumber.enable = true;
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

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
  system.stateVersion = "25.05"; # Did you read the comment?

}

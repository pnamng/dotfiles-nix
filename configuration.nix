# Edit this configuration file to define what shoud be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Boot config --------------------------------------------------
  ## Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  ## Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ 
    "amdgpu"
    "nvidia"
    "nvidia_modeset" 
    "nvidia_uvm" 
    "nvidia_drm"
  ];
  boot.kernelParams = [
    "drm.edid_firmware=eDP-1:edid/edid.bin"
    "video=eDP-1:e"
    "nvidia-drm.fbdev=1"
    # "nvidia-drm.modeset=1"
    # "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

  # boot.kernelPatches = [
  #   {
  #     name = "edid-loader-fix-config";
  #     patch = null;
  #     extraConfig = ''
  #       FW_LOADER y
  #     '';
  #   }
  # ];

  networking.hostName = "froggo"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-unikey
    ];
  };

  fonts = {
    packages = with pkgs; [
      inter
      font-awesome
      cascadia-code
      (nerdfonts.override { 
        fonts = [ 
          "FiraCode" 
          "JetBrainsMono"
          "Overpass"
        ]; 
      })
    ];
    fontconfig = {
      cache32Bit = true;
      allowBitmaps = true;
      useEmbeddedBitmaps = true;
      subpixel.rgba = "rgb";
      hinting.style = "medium";
      defaultFonts = {
        serif = ["NotoSerif"];
        sansSerif = ["Inter"];
        monospace = [ "JetBrainsMono" ];
      };
    };
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.froggo = {
    isNormalUser = true;
    description = "froggo";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    zsh
    lshw
    git
    gcc
    dig
    gnupg
    nixd
  ];

  programs.firefox.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "z"
        "git"
      ];
    };  	
  };

  # programs.hyprland = {
  #   enable = true;
  #   package = pkgs-unstable.hyprland;
  #   portalPackage = pkgs.xdg-desktop-portal-hyprland;
  #   xwayland.enable = true;
  # };


  # Bluetooth --------------------------------------------------
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Graphics ---------------------------------------------------
  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services = {
    xserver = {
      videoDrivers = [
        "amdgpu"
        "nvidia"
      ];
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      # desktopManager = {
      #   gnome.enable = true;
      # };
      # displayManager = {
      #   gdm = {
      #     enable = true;
      #   };
      # };
    };


    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
      };
    };
    desktopManager = {
      plasma6.enable = true;
    };
  };

  # List services that you want to enable:
  services = {
    resolved.enable = true;
    # Enable the OpenSSH daemon.
    openssh.enable = true;
  };


  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    forceFullCompositionPipeline = true;
    # package = config.boot.kernelPackages.nvidiaPackages.beta;
    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #   version = "555.58.02";
    #   sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
    #   sha256_aarch64 = "sha256-wb20isMrRg8PeQBU96lWJzBMkjfySAUaqt4EgZnhyF8=";
    #   openSha256 = "sha256-8hyRiGB+m2hL3c9MDA/Pon+Xl6E788MZ50WrrAGUVuY=";
    #   settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
    #   persistencedSha256 = "sha256-a1D7ZZmcKFWfPjjH1REqPM5j/YLWKnbkP9qfRyIyxAw=";
    # };
  };

  hardware.nvidia.prime = {
		offload = {
			enable = true;
			enableOffloadCmd = true;
		};
    amdgpuBusId = "PCI:6:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  hardware.firmware = [
    (pkgs.runCommandNoCC "firmware-custom-edid" {compressFirmware = false;} ''
      mkdir -p $out/lib/firmware/edid/
      cp "${./edid/edid.bin}" $out/lib/firmware/edid/edid.bin
    '')
  ];

  # ---------------------------------------------------------------------------
  virtualisation.virtualbox.host.enable = true;
  # virtualisation.virtualbox.host.enableExtenstionPack = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };


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
  system.stateVersion = "24.05"; # Did you read the comment?

}

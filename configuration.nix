{ pkgs, pkgs-unstable, ... }:

{
  imports = [
    # Include the results of the hardware scan. 
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
    "nvidia-drm.fbdev=1"
    # "nvidia-drm.modeset=1"
    # "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];

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
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
      fcitx5-unikey
    ];
  };

  # fonts --------------------------------
  fonts = {
    packages = with pkgs; [
      inter
      font-awesome
      cascadia-code
      noto-fonts-cjk-sans
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

  security.pam.services.kwallet = {
    name = "kwallet";
    enableKwallet = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.froggo = {
    isNormalUser = true;
    description = "froggo";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs; with pkgs.nodePackages; [
      nodejs
      # playerctl
      networkmanagerapplet
    ] ++ [
      # node pkgs
      typescript
      typescript-language-server
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; with pkgs-unstable; [
    vim
    zsh
    lshw
    git
    gcc
    dig
    gnupg
    nixd
    nixfmt-rfc-style
    gvfs
    xfce.thunar
    qbittorrent
    obsidian
  ] ++ [
    # ---------------------------
    (microsoft-edge.override {
      commandLineArgs = [
        "--ozone-platform=wayland"
      ];
    })
  ];

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
    };


    displayManager = {
      sddm = {
        enable = true;
        extraPackages = [
          pkgs.libsForQt5.qtgraphicaleffects
          pkgs.libsForQt5.qtmultimedia
        ];
        theme = "${import ./sddm-theme.nix { inherit pkgs; }}";

        wayland.enable = true;
      };
    };
  };
  programs.hyprland.enable = true;
  programs.firefox.enable = true;

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      theme = "mortalscumbag";
      plugins = [
        "z"
        "git"
      ];
    };  	
  };

  # Bluetooth --------------------------------------------------
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;


  # Graphics ---------------------------------------------------
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };



  # List services that you want to enable:
  services = {
    resolved.enable = true;
    # Enable the OpenSSH daemon.
    openssh.enable = true;
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
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
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:6:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # set edid
  hardware.firmware = [
    (pkgs.runCommandNoCC "firmware-custom-edid" {compressFirmware = false;} ''
      mkdir -p $out/lib/firmware/edid/
      cp "${./edid/edid.bin}" $out/lib/firmware/edid/edid.bin
    '')
  ];
  hardware.display.edid.enable = true;
  hardware.display.outputs."eDP-1".edid = "edid.bin";

  # ---------------------------------------------------------------------------
  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;
  # virtualisation.docker.rootless = {
  #   enable = true;
  #   setSocketVariable = true;
  # };

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

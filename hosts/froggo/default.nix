{ pkgs, pkgs-unstable, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  imports = [
    ./hardware-configuration.nix
    # ../../system
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
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxusers"
      "docker"
    ];
    shell = pkgs.zsh;
    packages =
      with pkgs;
      with pkgs.nodePackages;
      [
        nodejs
        playerctl
        zed-editor
        xfce.thunar
        qbittorrent
        (
          obsidian.override {
            commandLineArgs = [
              "--ozone-platform=wayland"
              "--enable-wayland-ime"
            ];
          }
        )
        networkmanagerapplet
        shotwell
      ]
      ++ [
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
  environment.systemPackages =
    with pkgs;
    with pkgs-unstable;
    [
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
    ]
    ++ [
      # ---------------------------
      (microsoft-edge.override {
        commandLineArgs = [
          "--ozone-platform=wayland"
          "--enable-wayland-ime"
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
        theme = "${import ../../sddm-theme.nix { inherit pkgs; }}";

        wayland.enable = true;
      };
    };
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

  # ---------------------------------------------------------------------------
  virtualisation.virtualbox.host.enable = true;
  virtualisation.docker.enable = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}

{ pkgs, ... } : {
  services.blueman.enable = true;

  # Enable sound with pipewire.
  hardware = {
    pulseaudio.enable = false;
    # Bluetooth --------------------------------------------------
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    # Graphics ---------------------------------------------------
    # Enable OpenGL
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
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
    firmware = [
      (pkgs.runCommandNoCC "firmware-custom-edid" {compressFirmware = false;} ''
        mkdir -p $out/lib/firmware/edid/
        cp "${edid/edid.bin}" $out/lib/firmware/edid/edid.bin
      '')
    ];

    display = {
      edid.enable = true;
      outputs."eDP-1".edid = "edid.bin";
    };
  };
}

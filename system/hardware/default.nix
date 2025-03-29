{ pkgs, ... }:
{
  # Enable sound with pipewire.
  hardware = {
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
      (pkgs.runCommandNoCC "firmware-custom-edid" { compressFirmware = false; } ''
        mkdir -p $out/lib/firmware/edid/
        cp "${edid/edid.bin}" $out/lib/firmware/edid/edid.bin
      '')
    ];

    display = {
      edid.enable = true;
      outputs."eDP-1".edid = "edid.bin";
    };
  };

  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };
}

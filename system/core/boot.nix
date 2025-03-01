{ pkgs, ... }:
{
  # Boot config --------------------------------------------------
  ## Bootloader
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    ## Kernel
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [
      "amdgpu"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    kernelParams = [
      "nvidia-drm.fbdev=1"
      # "nvidia-drm.modeset=1"
      # "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
  };
}

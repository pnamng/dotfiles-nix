{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    ## Kernel
    kernelPackages = pkgs.linuxPackagesFor (
      pkgs.linux_6_12.override {
        argsOverride = rec {
          src = pkgs.fetchurl {
            url = "mirror://kernel/linux/kernel/v6.x/linux-${version}.tar.xz";
            sha256 = "15xjjn8ff7g9q0ljr2g8k098ppxnpvxlgv22rdrplls8sxg6wlaa";
          };
          version = "6.12.10";
          modDirVersion = "6.12.10";
        };
      }
    );
    initrd.kernelModules = [
      "amdgpu"
      "nvidia"
      "nvidia_modeset"
      "nvidia_uvm"
      "nvidia_drm"
    ];
    kernelParams = [
      "console=tty1"
      "nvidia-drm.fbdev=1"
      # "nvidia-drm.modeset=1"
      # "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
  };
}

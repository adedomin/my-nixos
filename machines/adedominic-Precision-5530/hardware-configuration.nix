{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ac476345-5620-41ce-ba05-36adc71ad778";
      fsType = "btrfs";
    };

  boot.initrd.luks.devices."luks-root".device = "/dev/disk/by-uuid/89c22f33-f3ba-42d7-958f-8c2ddb6c9dda";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/E3CB-BB01";
      fsType = "vfat";
    };

    swapDevices =
      [ { device = "/dev/disk/by-partuuid/cfe33ee7-6e42-814c-9008-1669d59489d2";
          randomEncryption.enable = true;
      } ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

  services.udev.extraRules = ''
    KERNEL=="0000:01:00.0",SUBSYSTEM=="pci",ACTION=="add",ATTR{remove}="1"
  '';
}

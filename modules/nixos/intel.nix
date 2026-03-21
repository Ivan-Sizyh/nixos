{ config, lib, pkgs, ... }:

{
  hardware.graphics.enable = true;

  services.tlp.enable = true;

  services.earlyoom = {
    enable = true;
    freeMemThreshold = 5;
  };

  boot.kernelParams = [
    "mitigations=off"
    "intel_idle.max_cstate=1"
  ];

  powerManagement.cpuFreqGovernor = "powersave";
}

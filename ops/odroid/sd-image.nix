{ pkgs, lib, ... }: {
  nixpkgs.crossSystem.system = "armv7l-linux";

  imports = [
    <nixpkgs/nixos/modules/installer/sd-card/sd-image-armv7l-multiplatform.nix>
    ../../common/users/default.nix
  ];

  # As per documentation https://nixos.wiki/wiki/NixOS_on_ARM/ODROID-HC1
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_hardkernel_latest;
  boot.consoleLogLevel = lib.mkForce 7;
}

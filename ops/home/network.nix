{
  # Configuration for the network in general.
  network = { description = "My awesome home network"; };

  "vpn" = { config, pkgs, lib, ... }: {
    imports = [
      ../../common
      ../../hosts/vpn/configuration.nix
      ../../hosts/vpn/hardware-configuration.nix
      ../../hosts/vpn/networking.nix
    ];

    deployment.targetUser = "root";
    deployment.targetHost = "68.183.213.180";
  };
}


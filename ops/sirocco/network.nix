{
  # Configuration for the network in general.
  network = { description = "Thetis runs the lunef.xyz"; };

  "sirocco" = { modulesPath, lib, name, ... }: {
    imports =
      lib.optional (builtins.pathExists ./do-userdata.nix) ./do-userdata.nix
      ++ [
        (modulesPath + "/virtualisation/digital-ocean-config.nix")
        ../../hosts/sirocco/configuration.nix
        ../../common
      ];

    deployment.targetUser = "root";
    deployment.targetHost = "46.101.116.149";
    networking.hostName = name;
  };
}


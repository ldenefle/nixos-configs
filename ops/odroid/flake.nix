{
  description = "Build image";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
  outputs = { self, nixpkgs }: rec {
    nixosConfigurations.odroid-hc2 = nixpkgs.lib.nixosSystem {
      modules = [
        "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-armv7l-multiplatform.nix"
        {
          nixpkgs.config.allowUnsupportedSystem = true;
          nixpkgs.config.allowBroken = true;
          nixpkgs.hostPlatform.system = "armv7l-linux";
          nixpkgs.buildPlatform.system = "x86_64-linux";
          # ... extra configs as above

          boot.kernelPackages = nixpkgs.pkgs.linuxPackages_hardkernel_latest;
          boot.consoleLogLevel = 7;
        }
      ];
    };
    images.odroid-hc2 = nixosConfigurations.odroid-hc2.config.system.build.sdImage;
  };
}


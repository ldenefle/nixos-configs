{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [ "8.8.8.8" ];
    defaultGateway = "68.183.208.1";
    defaultGateway6 = {
      address = "";
      interface = "eth0";
    };
    dhcpcd.enable = false;
    usePredictableInterfaceNames = lib.mkForce false;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          {
            address = "68.183.213.180";
            prefixLength = 20;
          }
          {
            address = "10.19.0.5";
            prefixLength = 16;
          }
        ];
        ipv6.addresses = [{
          address = "fe80::7cc1:34ff:fe0c:ec83";
          prefixLength = 64;
        }];
        ipv4.routes = [{
          address = "68.183.208.1";
          prefixLength = 32;
        }];
        ipv6.routes = [{
          address = "";
          prefixLength = 128;
        }];
      };

    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="7e:c1:34:0c:ec:83", NAME="eth0"
    ATTR{address}=="5e:ba:6d:3b:34:fd", NAME="eth1"
  '';
}

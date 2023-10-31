{ config, pkgs, ... }:

let
  fetchKeys = username:
    (builtins.fetchurl "https://github.com/${username}.keys");
in {
  users.users.lucas = {
    isNormalUser = true;

    home = "/home/lucas";

    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keyFiles = [ (fetchKeys "ldenefle") ];

    packages = with pkgs; [ htop fd silver-searcher ];
  };

  # Use my SSH keys for logging in as root.
  users.users.root.openssh.authorizedKeys.keyFiles =
    config.users.users.lucas.openssh.authorizedKeys.keyFiles;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "yes";
  };

  services.getty.autologinUser = "root";

  security = {
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };
}


# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, environment, ... }:

let
  myPkgs = import ../../pkgs {inherit pkgs;};
  blog = myPkgs.blog;
in {
  services.openssh.enable = true;

  zramSwap.enable = true;

  programs = { zsh = { enable = true; }; };

  environment.systemPackages = with pkgs; [ python3 ];

  services.caddy = {
    enable = true;
    virtualHosts."blog.lunef.xyz".extraConfig = ''
      encode gzip
      file_server
      root * ${blog}
    '';
  };

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 443 ];
  };

  system.stateVersion = "22.11";
}


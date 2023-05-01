# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, environment, ... }:

let
  metadata =
    pkgs.callPackage /home/cadey/code/nixos-configs/ops/metadata/peers.nix { };
in {
  imports = [ ../../common/users/home-manager.nix ];

  networking.hostName = "vpn"; # Define your hostname.
  networking.domain = "";
  networking.useDHCP = false;

  services.openssh.enable = true;

  zramSwap.enable = true;

  programs = { zsh = { enable = true; }; };

  environment.systemPackages = with pkgs; [ tailscale transmission python3 ];

  services.tailscale.enable = true;

  system.stateVersion = "22.11";
}


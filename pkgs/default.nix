{ pkgs, ... }:
{
  blog = pkgs.callPackage ./blog/default.nix {};
}

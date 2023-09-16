#!/bin/sh

nix-build '<nixpkgs>' -A pkgsCross.armv7l-hf-multiplatform.odroid-xu3-bootloader

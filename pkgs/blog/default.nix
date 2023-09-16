{ lib, stdenv, fetchgit, hugo }:

stdenv.mkDerivation rec {
    name = "blog.lunef.xyz";
    version = "0.1";
    src = fetchgit (builtins.fromJSON (builtins.readFile ./source.json));

    buildInputs = [hugo];
    dontConfigure = true;

    # Copy source into working directory and 
    buildPhase = ''
        cp -r $src/* .
        # I need to specify the config because only more recent builds of hugo
        # look for a file named hugo.toml.
        ${hugo}/bin/hugo --config hugo.toml
    '';

    installPhase = ''
        mkdir -p $out
        cp -r public/* $out/
    '';
}


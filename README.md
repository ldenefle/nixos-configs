# NixOS

## Description

This repository is a playground to experience with automatic deployments of NixOs machines. It uses [morph](https://github.com/DBCDK/morph), [nixos-infect](https://github.com/elitak/nixos-infect) and ofc NixOS under the hood. It's based on the excellent [blog post from Xe Iaso](https://xeiaso.net/blog/morph-setup-2021-04-25) which is a must read like many of their blog posts.

As of now it deploys a functional OS on a droplet called `vpn` hosted on DigitalOcean. It creates a user `lucas`, installs ssh authorized keys, some shell tools, a custom script `say-hello` and a fake config file. 

The only parts that needs updating for a new machine are the networking parts. This has yet to be automated further.

I'll push soon more of my homelab infrastructure on this project.

## Tools

### Deploy

```
(cd ops/home && ./push)
```

### Format

```
nix-shell -p nixfmt fd --command "fd nix . -X nixfmt {}"
```

### Generate base image
 
A nix derivation is provided to generate a base image for DigitalOcean in `base/digitalocean`. The `result/nixos.qcow2.gz` can be uploaded as an image on DigitalOcean.


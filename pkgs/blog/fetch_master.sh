#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash nix-prefetch-git jq

set -e

GIT_URL="https://github.com/ldenefle/blog.lunef.xyz"
tmp=$(mktemp)


jq --arg sha "$(nix hash to-sri sha256:$(nix-prefetch-git --quiet --url ${GIT_URL} | jq -r '.sha256'))" '.sha256 = $sha' source.json > "$tmp" && mv "$tmp" source.json

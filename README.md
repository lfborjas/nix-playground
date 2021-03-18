# Backend

## Building

Given nix is installed, this should build the executable for a given repo in the `code` folder:

    nix-build -A example-app ./nix/monorepo.nix

## Setup

We use [nix](https://nixos.org/guides/install-nix.html) for compiling the packages in this project. At the time of writing, installation on
macOS was possible wit the following command:

    sh (curl -L https://nixos.org/nix/install | psub ) --darwin-use-unencrypted-nix-store-volume

If using `fish`, [nix-env.fish](https://github.com/lilyball/nix-env.fish) points to the right places
for the various commands, and autocompletion.

### Nix Reference

I followed these guides:

- [Haskell Monorepo](https://github.com/fghibellini/nix-haskell-monorepo)
- [Haskell + Nix](https://github.com/Gabriel439/haskell-nix/)
- [Haskell, Nix, Docker in ECS](https://williamyaoh.com/posts/2019-04-09-deploying-haskell-with-ecs-and-nix.htm)
- [nix.dev](https://nix.dev/tutorials/towards-reproducibility-pinning-nixpkgs.html#)

#### Niv

I use [`niv`](https://github.com/nmattia/niv) to [pin nixpkgs](https://nix.dev/tutorials/towards-reproducibility-pinning-nixpkgs.html#), and manage other deps. To install:

    nix-env -iA nixpkgs.niv

### Troubleshooting

To update to a specific nixpkgs branch:
    niv update nixpkgs -b release-20.09

To check the default ghc:

    nix-instantiate --eval -E '(import ./nix/release.nix {}).haskellPackages.ghc.version'

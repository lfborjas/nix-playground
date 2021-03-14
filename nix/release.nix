{ sources ? import ./sources.nix, compiler ? "ghc8102" }:
with
  { overlay = _: pkgs: 
    {
      niv = (import sources.niv {}).niv;
    };
  };
import sources.nixpkgs
  { 
    overlays = [ overlay ] ; config = {
      allowUnfree = true;
      packageOverrides = pkgs: rec {
        haskellPackages = pkgs.haskell.packages."${compiler}".override {
          overrides = self: super: builtins.mapAttrs (name: path: super.callCabal2nix name path {}) (import ./packages.nix);
        };
          # haskell = pkgs.haskell // {
          #   "${compiler}" = pkgs.haskell.packages."${compiler}".override {
          #     overrides = self: super: builtins.mapAttrs (name: path: super.callCabal2nix name path {}) (import ./packages.nix);
          #   };
          # };
      };
    }; 
  }

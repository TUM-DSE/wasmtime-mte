{
  description = "A devShell example";

  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    rust-overlay.url = "github:oxalica/rust-overlay";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        overlays = [ (import rust-overlay) ];
        pkgs = import nixpkgs {
          inherit system overlays;
        };
        myRust = pkgs.rust-bin.nightly.latest.default.override {
          extensions = ["rust-src"];
        };
      in
      with pkgs;
      {
        devShells.default = mkShell {
          buildInputs = [
            myRust
          ];
          env = {
            RUST_BACKTRACE = "full";
          };
        };
      }
    );
}


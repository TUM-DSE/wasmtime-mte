with import <nixpkgs> { };
let
  fenix = callPackage
    (fetchFromGitHub {
      owner = "nix-community";
      repo = "fenix";
      # commit from: 2023-03-03
      rev = "e2ea04982b892263c4d939f1cc3bf60a9c4deaa1";
      hash = "sha256-AsOim1A8KKtMWIxG+lXh5Q4P2bhOZjoUhFWJ1EuZNNk=";
    })
    { };
in
mkShell {
  name = "rust-env";
  nativeBuildInputs = [
    # Note: to use stable, just replace `default` with `stable`
    fenix.default.toolchain
  ];
  buildInputs = [
  ];

  # Set Environment Variables
  RUST_BACKTRACE = 1;
}

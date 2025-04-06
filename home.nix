{ inputs }: { pkgs, ... }:
{
  programs.bash.enable = true;
  programs.bash.enableCompletion = true;

  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.registry.n.flake = inputs.nixpkgs;

  home.stateVersion = "24.05";
}

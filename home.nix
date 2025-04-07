{ inputs }: { pkgs, config, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    sessionVariables = {
      PS1 = "\\[\\e[0;32m\\]\\w\\[\\e[0m\\] \\[\\e[0;97m\\]\$\\[\\e[0m\\] ";
      NIX_PATH = "nixpkgs=flake:nixpkgs";
    };
    shellAliases = {
      ls = "ls --color=auto";
      ll = "ls -l --color=auto";
      la = "ls -A --color=auto";
      l = "ls -CF --color=auto";
      grep = "grep --color=auto";
    };
    profileExtra = ''
      eval "$(dircolors -b)"
    '';
  };

  home.file."tmp".source = config.lib.file.mkOutOfStoreSymlink "/sdcard/_tmp";
  home.file."downloads".source = config.lib.file.mkOutOfStoreSymlink "/sdcard/_tmp";

  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.registry.n.flake = inputs.nixpkgs;

  home.stateVersion = "24.05";
}

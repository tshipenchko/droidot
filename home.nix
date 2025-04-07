{ inputs }: { pkgs, config, ... }:
{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    sessionVariables = {
      PS1 = "\\[\\e[0;32m\\]\\w\\[\\e[0m\\] \\[\\e[0;97m\\]\$\\[\\e[0m\\] ";
      NIX_PATH = "nixpkgs=flake:nixpkgs";
      DIRENV_LOG_FORMAT = "";
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
      eval "$(ssh-agent -s -t 10m)"
      trap "kill $SSH_AGENT_PID" EXIT
    '';
  };

  programs.git = {
    enable = true;
    userName = "Łukasz Tshipenchko";
    userEmail = "dev@zxc.sx";
    extraConfig = {
      init.defaultBranch = "master";
    };
    ignores = [ ".envrc" ".direnv" ];
    aliases = {
      pp = "!git pull && git push";
    };
  };

  programs.direnv = {
    enable = true;
    enableBashIntegration = true;
    nix-direnv.enable = true;
  };

  home.file."tmp".source = config.lib.file.mkOutOfStoreSymlink "/sdcard/_tmp";
  home.file."downloads".source = config.lib.file.mkOutOfStoreSymlink "/sdcard/_tmp";

  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.registry.n.flake = inputs.nixpkgs;

  home.stateVersion = "24.05";
}

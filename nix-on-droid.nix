{ inputs }: { config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    vim
    nano
    procps
    killall
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    git
    gnumake
    wget
    curl
    lynx
    gawk
    comma
    nix-index
  ];

  environment.etcBackupExtension = ".bak";
  system.stateVersion = "24.05";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  time.timeZone = "Asia/Oral";
  home-manager.config = (import ./home.nix { inputs = inputs; });
}

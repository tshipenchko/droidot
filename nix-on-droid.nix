{ inputs }: { config, lib, pkgs, ... }:

{
  environment.packages = with pkgs; [
    vim
    nano
    procps
    killall
    ncurses
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
    axel
    lynx
    gawk
    tmux
    comma
    nix-index
    openssh
    nixpkgs-fmt
    iperf
    micro
    calc
    htop
    neofetch
    fastfetch
    ouch
    nmap
    zip
    unzip
    unrar-wrapper
    nmap
    iproute2
    ethtool
    nettools
    inetutils
    python3Packages.speedtest-cli
    python3Packages.yt-dlp
    file
    jq
    ffmpeg
    dig
    binutils
    poppler_utils
    calc
    postgresql
    net-snmp
    imagemagick

    python3
    pypy3
    black
    isort
    ruff
    gcc
    gnumake
    cmake
    nodejs
    rustup
    go
    gofumpt
    bc
  ];

  environment.etcBackupExtension = ".bak";
  system.stateVersion = "24.05";
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  time.timeZone = "Asia/Oral";
  home-manager.config = (import ./home.nix { inputs = inputs; });
}

{ config, lib, pkgs, inputs, ... }:

{
  home.packages = [
    inputs.fsel.packages.${pkgs.stdenv.hostPlatform.system}.default
  ] ++ (with pkgs; [
    nh
    claude-code
    brightnessctl
    playerctl
    lazydocker
    lazygit
    spotify
    vesktop
    jq
    zoxide
    btop
    grim
    slurp
    mako
    compsize
    duperemove
    pavucontrol
    wdisplays
    wl-mirror
    wtype
    thunar
    stow
    zinit
    fzf
  ]);
}

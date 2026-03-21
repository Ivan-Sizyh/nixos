{ config, lib, pkgs, inputs, ... }:

{
  home.packages = [
    inputs.fsel.packages.${pkgs.stdenv.hostPlatform.system}.default
  ] ++ (with pkgs; [
    brightnessctl
    playerctl
    lazygit
    jq
    zoxide
    btop
    grim
    slurp
    mako
    pavucontrol
    wdisplays
    wtype
    thunar
    zinit
    fzf

    go
    gopls
    ruby
    mise

    wireguard-tools
    amneziawg-go
    sing-box
    openvpn
    networkmanager-openvpn
  ]);
}

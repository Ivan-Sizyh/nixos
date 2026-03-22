{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
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
  ];
}

{ config, pkgs, lib, ... }: let
  cfg = config.desktop.hyprland;
in {
  options.desktop.hyprland.enable = lib.mkEnableOption "Whether or not to enable and configure Hyprland.";

  config.programs.hyprland.enable = lib.mkIf cfg.enable true;
}

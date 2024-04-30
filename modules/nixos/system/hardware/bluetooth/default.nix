{ config, pkgs, lib, ... }: let
  cfg = config.hardware.bluetooth;
in {
  options.system.hardware.bluetooth.enable = lib.mkEnableOption "Whether or not to enable bluetooth.";

  config.hardware.bluetooth.enable = lib.mkIf cfg.enable true;
}

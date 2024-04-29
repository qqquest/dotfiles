{ pkgs, lib, config, ... }: let
  cfg = config.system.boot;
in {
  options.system.boot.enable =
    lib.mkEnableOption "Whether or not to enable booting.";

  config.boot.loader = lib.mkIf cfg.enable {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}

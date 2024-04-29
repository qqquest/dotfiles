{ config, pkgs, lib, ... }: let
  cfg = config.desktop.sway;
in {
  options.desktop.sway.enable = lib.mkEnableOption "Whether or not to enable and configure Sway.";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      grim
      slurp
      wl-clipboard
      mako
    ];

    services.gnome.gnome-keyring.enable = true;

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
    };
  };
}

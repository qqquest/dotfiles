{ config, pkgs, lib, ... }: let
   cfg = config.tools.git;
in {
  options.tools.git.enable = lib.mkEnableOption "Whether or not to enable Git.";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ git ];
  };
}

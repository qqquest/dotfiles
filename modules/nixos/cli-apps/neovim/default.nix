{ pkgs, lib, config, ... }: let
  cfg = config.cli-apps.neovim;
in {
  options.cli-apps.neovim.enable =
    lib.mkEnableOption "Whether or not to enable Neovim.";

  config.programs.neovim.enable =
    lib.mkIf cfg.enable true;
}

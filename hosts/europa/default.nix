{ config, pkgs, ... }:
{
  imports = [
    ./hardware.nix
    ../../modules
  ];

  system.boot.enable = true;
  tools.git.enable = true;
  cli-apps.neovim.enable = true;
  desktop.sway.enable = true;

  virtualisation.virtualbox.guest.enable = true;

  networking = {
    hostName = "europa";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Sao_Paulo";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  users.users.vini = {
    isNormalUser = true;
    description = "vini";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = "nix-command flakes";

  system.stateVersion = "23.11"; 
}

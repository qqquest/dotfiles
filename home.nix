{ pkgs, ... }:
{
  home.username = "vini";
  home.homeDirectory = "/home/vini";

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;
    extensions = (with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "gloam";
        publisher = "exthitblast";
        version = "1.0.4";
        sha256 = "sha256-9+YLYBzNGBY36Qb+AsoFn2RXqSCKXHhwJADL2BlmMxQ";
      }
      {
        name = "beardedicons";
        publisher = "beardedbear";
        version = "1.18.0";
        sha256 = "sha256-m8utv500Xk6jLI5ndNfiOoPZfyJcLC2XuNwLdC9J+6w";      
      }
    ];
    userSettings = {
      "workbench.colorTheme" = "Gloam";
      "workbench.iconTheme" = "bearded-icons";
      "workbench.statusBar.visible" = false;
      "workbench.activityBar.location" = "hidden";
      "workbench.editor.limit.perEditorGroup" = true;
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 1;
      "workbench.editor.closeEmptyGroups" = false;
      "workbench.editor.enablePreview" = false;
      "workbench.editor.showTabs" = "single";
      "editor.minimap.enabled" = false;
      "editor.cursorStyle" = "block";
      "editor.fontFamily" = "Fira Code";
      "editor.fontWeight" = 500;
      "editor.fontSize" = 14.5;
      "editor.lineHeight" = 1.6;
      "editor.stickyScroll.enabled" = false;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "editor.scrollbar.verticalScrollbarSize" = 0;
      "editor.scrollbar.horizontalScrollbarSize" = 0;
      "breadcrumbs.enabled" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "nix.serverSettings" = {
        nil.formatting.command = [ "nixpkgs-fmt" ];
      };
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}

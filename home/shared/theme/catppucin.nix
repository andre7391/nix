{ inputs, pkgs, ... }: {

  # themes
  home.packages = with pkgs;  [
    catppuccin-cursors.mochaDark
  ];

  # gtk theme
  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Mauve-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "mauve" ];
        size = "compact";
        # tweaks = [ "rimless" "black" ]; # You can also specify multiple tweaks here
        variant = "mocha";
      };
    };
    iconTheme = {
      name = "Catppuccin-Mocha-Compact-Mauve-dark";
    };
    cursorTheme = {
      name = "Catppuccin-Mocha-Dark-Cursors";
    };
  };

  # cursor theme
  home.file.".icons/default/index.theme".text = ''
    [icon theme] 
    Inherits=Catppuccin-Mocha-Dark-Cursors
  '';
}

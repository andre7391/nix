{ pkgs, config, ... }:
{



  imports = [
    #  ../../home/shared/theme
  ];



  # programs
  home.packages = with pkgs; [
    # python
    #(pkgs.python311.withPackages python-packages)
    pkgs.poetry
  ];


  # services.picom.enable = true;

}

# Enable and configure my keyboard layout. (also on the tty!)

{
  services.xserver.extraLayouts = {
    custom = {
      description = "my own custom layout";
      symbolsFile = symbols/custom;
      languages = [ "en" "fr" "de" ];
    };

    custom_xbows = {
      description = "my own custom layout (X-Bows)";
      symbolsFile = symbols/custom_xbows;
      languages = [ "en" "fr" "de" ];
    };
  };
}

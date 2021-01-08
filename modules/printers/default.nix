{ pkgs, ... }:

# Add known printer if CUPS is enabled

{
  services.printing.drivers = with pkgs; [
    hplip
  ];

  hardware.printers = {
    ensurePrinters = [ {
      name = "HP_Color_LaserJet_Pro_M479";
      location = "Mezzanine";
      deviceUri = "socket://lasercolor.ici:9100";
      model = "HP/hp-color_laserjet_pro_m479-ps.ppd.gz";
      ppdOptions = {
        PageSize = "A4";
      };
    }];
  };
}

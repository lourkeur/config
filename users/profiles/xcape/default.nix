{
  services.xcape = {
    enable = true;
    mapExpression = {
      "Alt_L" = "Escape";
      "Control_R" = "Tab";
      "Shift_R" = "Shift_R|Tab";

      # Compensate the lack of a ≷ on ANSI boards
      "Shift_L" = "less";
    };
  };
}

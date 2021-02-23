{
  services.postgresql = {
    enable = true;
    ensureUsers = [
      {
        name = "louis";
        ensurePermissions = {
          "DATABASE sandbox" = "ALL PRIVILEGES";
        };
      }
    ];
    ensureDatabases = [ "sandbox" ];
  };
}

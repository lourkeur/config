self: super:

{
  vscode-extensions = with self.vscode-utils; super.vscode-extensions // {
    scala-lang.scala = extensionFromVscodeMarketplace {
      name = "scala";
      publisher = "scala-lang";
      version = "0.3.8";
      sha256 = "17dl10m3ayf57sqgil4mr9fjdm7i8gb5clrs227b768pp2d39ll9";
    };
    lampepfl.dotty = extensionFromVscodeMarketplace {
      name = "dotty";
      publisher = "lampepfl";
      version = "0.1.16";
      sha256 = "0a331a49e76d90d326c7c05b2b003cb0c41764769815c76b3569439d991ee4d5";
    };
  };

  vscode-with-extensions = super.vscode-with-extensions.override {
    vscode = self.vscodium;
    vscodeExtensions = with self.vscode-extensions; [
      bbenoist.Nix
      vscodevim.vim
      scala-lang.scala
      scalameta.metals
      lampepfl.dotty
    ];
  };
}

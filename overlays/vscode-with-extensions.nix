final: prev:

{
  vscode-extensions = with final.vscode-utils; prev.vscode-extensions // {
    lampepfl.dotty = extensionFromVscodeMarketplace {
      name = "dotty";
      publisher = "lampepfl";
      version = "0.1.16";
      sha256 = "0a331a49e76d90d326c7c05b2b003cb0c41764769815c76b3569439d991ee4d5";
    };
  };

  vscode-with-extensions = prev.vscode-with-extensions.override {
    vscode = final.vscodium;
    vscodeExtensions = with final.vscode-extensions; [
      bbenoist.Nix
      vscodevim.vim
      scala-lang.scala
      scalameta.metals
      lampepfl.dotty
    ];
  };
}

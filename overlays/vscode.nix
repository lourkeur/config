self: super:

{
  vscode-extensions = with self.vscode-utils; super.vscode-extensions // {
    scala-lang.scala = extensionFromVscodeMarketplace {
      name = "scala";
      publisher = "scala-lang";
      version = "0.4.5";
      sha256 = "bc7f4e16ea14b860f4b4e73602065bdcd53a7447e440f712e3db20759418325b";
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

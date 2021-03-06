{ ripgrep, git, fzf, makeWrapper, vim_configurable, vimPlugins, fetchFromGitHub, writeTextDir
, lib, stdenv, runCommandNoCC, remarshal, formats }:
with stdenv;
let
  format = formats.toml {};
  vim-customized = vim_configurable.customize {
    name = "vim";
    # Not clear at the moment how to import plugins such that
    # SpaceVim finds them and does not auto download them to
    # ~/.cache/vimfiles/repos
    vimrcConfig.packages.myVimPackage = with vimPlugins; { start = [ ]; };
  };
in mkDerivation rec {
  pname = "spacevim";
  version = "1.6.0";
  src = fetchFromGitHub {
    owner = "SpaceVim";
    repo = "SpaceVim";
    rev = "v${version}";
    sha256 = "sha256-QQdtjEdbuzmf0Rw+u2ZltLihnJt8LqkfTrLDWLAnCLE=";
  };

  nativeBuildInputs = [ makeWrapper vim-customized];
  buildInputs = [ vim-customized ];

  buildPhase = ''
    # generate the helptags
    vim -u NONE -c "helptags $(pwd)/doc" -c q
  '';

  patches = [ ./helptags.patch ];

  installPhase = ''
    mkdir -p $out/bin

    cp -r $(pwd) $out/SpaceVim

    # trailing slash very important for SPACEVIMDIR
    makeWrapper "${vim-customized}/bin/vim" "$out/bin/spacevim" \
        --add-flags "-u $out/SpaceVim/vimrc" \
        --prefix PATH : ${lib.makeBinPath [ fzf git ripgrep]}
  '';

  meta = with lib; {
    description = "Modern Vim distribution";
    longDescription = ''
      SpaceVim is a distribution of the Vim editor that’s inspired by spacemacs.
    '';
    homepage = "https://spacevim.org/";
    license = licenses.gpl3Plus;
    maintainers = [ maintainers.fzakaria ];
    platforms = platforms.all;
  };
}

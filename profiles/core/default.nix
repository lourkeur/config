{ config, lib, pkgs, ... }:
let inherit (lib) fileContents;
in
{
  nix.package = pkgs.nixFlakes;

  nix.systemFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];

  i18n.defaultLocale = "fr_CH.UTF-8";
  time.timeZone = "Europe/Zurich";

  services.xserver.layout = "custom_xbows";
  console.useXkbConfig = true;

  environment = {

    variables = {
      CDPATH = ["." "~"];
      LESS = "-eRSX";  # e causes less to automatically exit when it reaches end-of-file.
                       # R causes less to let color sequences through.
                       # S causes less not to wrap long lines.
                       # X causes less not to clear the screen.
      LESSOPEN = "|${pkgs.lesspipe}/bin/lesspipe.sh %s";
      PAGER = "less";
    };

    systemPackages = with pkgs; [
      binutils
      coreutils
      curl
      deploy-rs
      direnv
      dnsutils
      dosfstools
      fd
      git
      gotop
      gptfdisk
      iputils
      jq
      less
      libarchive
      manix
      moreutils
      nix-index
      nmap
      pass-otp
      ripgrep
      tealdeer
      utillinux
      whois
    ];

    shellAliases =
      let ifSudo = lib.mkIf config.security.sudo.enable;
      in
      {
        # quick cd
        ".." = "cd ..";
        "..." = "cd ../..";
        "...." = "cd ../../..";
        "....." = "cd ../../../..";

        # bsdtar (multi-format archive)
        tar = "bsdtar";

        e = "$EDITOR";

        l = pkgs.writers.writeC "l" {} ./l.c;

        # git
        g = "git";

        # grep
        grep = "rg";
        gi = "grep -i";

        # internet ip
        myip = "dig +short myip.opendns.com @208.67.222.222 2>&1";

        # nix
        n = "nix";
        np = "n profile";
        ni = "np install";
        nr = "np remove";
        ns = "n search --no-update-lock-file";
        nf = "n flake";
        nepl = "n repl '<nixpkgs>'";
        srch = "nsni";
        nrb = ifSudo "sudo nixos-rebuild";
        mn = ''
          manix "" | grep '^# ' | sed 's/^# \(.*\) (.*/\1/;s/ (.*//;s/^# //' | sk --preview="manix '{}'" | xargs manix
        '';

        # fix nixos-option
        nixos-option = "nixos-option -I nixpkgs=${toString ../../compat}";

        # sudo
        s = ifSudo "sudo -E ";
        si = ifSudo "sudo -i";
        se = ifSudo "sudoedit";

        # top
        top = "gotop";

        # systemd
        ctl = "systemctl";
        stl = ifSudo "s systemctl";
        utl = "systemctl --user";
        ut = "systemctl --user start";
        un = "systemctl --user stop";
        up = ifSudo "s systemctl start";
        dn = ifSudo "s systemctl stop";
        jtl = "journalctl";

      } // lib.mapAttrs'
        (n: v:
          let
            prefix = lib.concatStrings (lib.take 2 (lib.stringToCharacters n));
            ref = from:
              if from ? ref
              then "ns ${from.id}/${from.ref}"
              else "ns ${from.id}";
          in
          lib.nameValuePair
            "ns${prefix}"
            (ref v.from)
        )
        config.nix.registry;
  };

  fonts = {
    fonts = with pkgs; [ source-code-pro libertinus ];

    fontconfig.defaultFonts = {
      monospace = lib.mkBefore [ "Source Code Pro" ];
      sansSerif = lib.mkBefore [ "Libertinus Sans" ];
      serif = lib.mkBefore [ "Libertinus Serif" ];
    };

    # lowercase numerals
    fontconfig.localConf = ''
    <match target="font">
      <edit name="fontfeatures" mode="append">
        <string>onum on</string>
      </edit>
    </match>
    '';
  };

  hardware.nitrokey.enable = true;

  nix = {

    autoOptimiseStore = true;

    gc.automatic = true;

    optimise.automatic = true;

    useSandbox = true;

    allowedUsers = [ "@wheel" ];

    trustedUsers = [ "root" "@wheel" ];

    extraOptions = ''
      min-free = 536870912
      keep-outputs = true
      keep-derivations = true
      fallback = true
    '';

  };

  programs.autojump.enable = true;

  programs.fish = {
    enable = true;
    promptInit = builtins.readFile ./prompt_init.fish;
  };

  programs.gnupg.agent.enable = true;
  programs.gnupg.agent.enableSSHSupport = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  security.pam.enableSSHAgentAuth = true;

  services.earlyoom.enable = true;

  services.openssh = {
    enable = true;
    startWhenNeeded = true;

    # hardening
    permitRootLogin = "no";
    challengeResponseAuthentication = false;
    passwordAuthentication = false;
  };

  users.defaultUserShell = "/run/current-system/sw/bin/fish";
  users.mutableUsers = false;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
}

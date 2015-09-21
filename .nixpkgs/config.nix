{
  allowBroken = true;
  allowUnfree = true;
  packageOverrides = pkgs: rec {
    dmenu = pkgs.dmenu.overrideDerivation (oldAttrs: {
      name = "dmenu-4.5_custom";
      buildInputs = [pkgs.xlibs.libX11 pkgs.xlibs.libXinerama pkgs.zlib pkgs.xlibs.libXft];
      patches = [];
      src = pkgs.fetchFromGitHub {
        repo   = "dmenu";
        owner  = "RyanMcG";
        rev    = "ea98b675d1f35afc813f94bcfcaff0bd193fe824";
        sha256 = "07fx9mrr48c94wfn3h0l3rq5h7k0aq5wmnq5cbqlm455hfrv1m6l";
      };
    });
  };
}

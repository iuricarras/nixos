{ pkgs }:

pkgs.stdenv.mkDerivation {
	name = "vimix";
	src = pkgs.fetchFromGitHub {
		owner = "iuricarras";
		repo = "gtk3-themes";
		rev = "98f84daa402a7f0b2f0e9e65e384c6e0d8ef33b4";
		sha256 = "sllqwmvGmbkNxSN1FLFMVaYgvYonNbauuU19ssDgVLo=";
	};
	dontUnpack = true;
	installPhase = ''
		mkdir -p $out/share/icons
		cp -r $src/cursors/Vimix $out/share/icons/
		'';
	}

{ pkgs }:

pkgs.stdenv.mkDerivation {
	name = "icons";
	src = pkgs.fetchFromGitHub {
		owner = "iuricarras";
		repo = "gtk3-themes";
		rev = "c8122275804bfc1a1cc54c874c43dabbe4daad51";
		sha256 = "kjOsjP9F5kzwgX3rkPjvaC9lmdGPuFbZMubasJjyj48=";
	};
	dontUnpack = true;
	installPhase = ''
		mkdir -p $out/share/icons
		cp -r $src/icons/* $out/share/icons/
		'';
	}

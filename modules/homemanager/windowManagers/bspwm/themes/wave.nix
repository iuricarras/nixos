{ pkgs }:

pkgs.stdenv.mkDerivation {
	name = "Wave";
	src = pkgs.fetchFromGitHub {
		owner = "iuricarras";
		repo = "gtk3-themes";
		rev = "b69c3213942aa743a7dea904734a544de3957ba6";
		sha256 = "X7Enmbz9xbLJsQaGKihcSplpGe80NGEaIwApmWdxQKg=";
	};
	dontUnpack = true;
	installPhase = ''
		mkdir -p $out/share/themes
		cp -r $src/themes/Wave $out/share/themes/
		'';
	}

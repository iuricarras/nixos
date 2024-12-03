{ pkgs }:

pkgs.stdenv.mkDerivation {
	name = "icons";
	# src = pkgs.fetchFromGitHub {
	# 	owner = "iuricarras";
	# 	repo = "gtk3-themes";
	# 	rev = "c8122275804bfc1a1cc54c874c43dabbe4daad51";
	# 	sha256 = "kjOsjP9F5kzwgX3rkPjvaC9lmdGPuFbZMubasJjyj48=";
	# };
	# dontUnpack = true;
	# installPhase = ''
	# 	mkdir -p $out/share/icons
	# 	cp -r $src/icons/* $out/share/icons/
	# 	'';
	# }

	src = pkgs.fetchFromGitHub {
		owner = "archcraft-os";
		repo = "archcraft-icons";
		rev = "a7490288b8f9c19ffa32cf2e1f188fce9f612274";
		sha256 ="u/U1X18KZXr8QIgTWKPXnydNzhNBxhaXOfZh7irAwws=";
	};
	dontUnpack = true;
	installPhase = ''
		mkdir -p $out/share/icons
		for i in $src/archcraft-icons-*; do
			cp -r $i/files/* $out/share/icons/
		done
	'';
}

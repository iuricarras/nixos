{ pkgs }:


pkgs.stdenv.mkDerivation {
				name = "archcraft";
				src = ./archcraft;
				dontUnpack = true;
				installPhase = ''
					mkdir -p $out
					cp -R ./* $out/
				'';
			};
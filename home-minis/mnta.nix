{pkgs, inputs, ...}:
{
	home.packages = with pkgs; [
		(stdenv.mkDerivation {
			name = "mnta";
			src = inputs.mnta;
			nativeBuildInputs = with pkgs; [
				pkg-config
				gcc
				gnumake
			];

			buildInputs = with pkgs; [
				gtk3.dev
				glib.dev
				vte.dev
				cjson
			];

			buildPhase = ''
				make
			'';

			installPhase = ''
				mkdir -p $out/bin
				cp mnta $out/bin/
			'';
		})
	];
}

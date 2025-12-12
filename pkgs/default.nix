{
  pkgs,
  source,
  variant,
}:

let
  # Used to set folder name of tool
  folderName = if variant == "base" then "proton-cachyos" else "proton-cachyos-${variant}";
  # Used to set display name of tool in Steam
  steamName = if variant == "base" then "Proton CachyOS" else "Proton CachyOS ${variant}";

in
pkgs.stdenv.mkDerivation {
  pname = folderName;
  version = pkgs.lib.removePrefix "cachyos-" source.version;

  inherit (source) src;

  nativeBuildInputs = [ pkgs.xz ];
  outputs = [
    "out"
    "steamcompattool"
  ];

  installPhase = ''
    runHook preInstall

    # Create the steamcompat directory
    mkdir -p $steamcompattool
    cp -r ./* $steamcompattool/

    # Modify the display name
    sed -i -r "s|\"display_name\".*|\"display_name\" \"${steamName}\"|" \
      $steamcompattool/compatibilitytool.vdf

    # Symlink to $out to avoid unclean /usr pathing of tools
    mkdir -p $out/share/steam/compatibilitytools.d/${folderName}
    ln -s $steamcompattool $out/share/steam/compatibilitytools.d/${folderName}

    runHook postInstall
  '';

  meta = with pkgs.lib; {
    description = "${steamName}";
    homepage = "https://github.com/CachyOS/proton-cachyos";
    license = licenses.bsd3;
    platforms = [ "x86_64-linux" ];
  };
}

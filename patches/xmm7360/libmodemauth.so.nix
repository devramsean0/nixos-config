{ stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "libmodemauth.so";
  version = "1.0.0";

  src = ../../thirdParty/xmm7360/libmodemauth.so;

  unpackPhase = ''
    echo "Unpacking libmodemauth.so";
    mkdir -p $out
    mkdir -p $TMPDIR
    cp $src $TMPDIR/libmodemauth.so
  '';

  installPhase = ''
    echo "Building libmodemauth.so";
    mkdir -p $out/lib
    cp $TMPDIR/libmodemauth.so $out/lib/
  '';
}

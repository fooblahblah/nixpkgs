{ stdenv, fetchurl, makeWrapper, python3, python3Packages, sip }:

stdenv.mkDerivation rec {
  appName = "scudcloud";
  name    = "${appName}-${version}";
  version = "1.0.56";

  src = fetchurl {
    url = "https://github.com/raelgc/scudcloud/archive/v${version}.tar.gz";
    sha256 = "b285c76281b3c30cd13b36f834ac25b20e1c57d4439560b77ea0897931842023";
  };

  buildInputs = [ makeWrapper ];


  installPhase = ''
     mkdir -pv $out/bin $out/lib $out/bin/resources \
               $out/share/applications \
               $out/share/licenses/${appName} \
               $out/share/icons/hicolor/scalable/apps \
               $out/share/icons/mono-dark/scalable/apps \
               $out/share/icons/mono-light/scalable/apps

    install -v -m644 scudcloud-1.0/lib/*.py $out/lib
    install -v -m644 scudcloud-1.0/resources/* $out/bin/resources
    install -v -m644 scudcloud-1.0/LICENSE $out/share/licenses/${appName}/LICENSE

    install -v -m644 scudcloud-1.0/${appName}.desktop \
             $out/share/applications/${appName}.desktop

    install -v -m644 scudcloud-1.0/systray/hicolor/* \
                   $out/share/icons/hicolor/scalable/apps

    install -v -m644 scudcloud-1.0/systray/mono-dark/* \
                   $out/share/icons/mono-dark/scalable/apps

    install -v -m644 scudcloud-1.0/systray/mono-light/* \
                   $out/share/icons/mono-light/scalable/apps
                   
    install -v -m755 scudcloud-1.0/${appName} $out/bin/${appName}
    
    wrapProgram $out/bin/${appName} \
        --prefix PYTHONPATH : "$out/lib:${python3Packages.pyqt4}/lib/${python3.libPrefix}/site-packages:${sip}/lib/${python3.libPrefix}/site-packages:${python3Packages.dbus}/lib/${python3.libPrefix}/site-packages" \
        --prefix PATH : "${python3}/bin"
  '';
  
  meta = with stdenv.lib; {
    description = "Linux desktop client for Slack";
    repositories.git = https://github.com/raelgc/scudcloud.git;
    license = licenses.mit;
    platforms = platforms.linux;
  };
}

{ stdenv, fetchgit, gnome3, gtk3, glib, json_glib, libsoup, sqlite, libav,
  intltool, vala, gst_all_1 }:

stdenv.mkDerivation rec {
  name = "corebird-1.1";

  src = fetchgit {
    url    = "https://github.com/baedert/corebird.git";
    rev    = "d535605341f2a1e8f20521ca54ed11bb2f999ed3";
    sha256 = "0azqk7a0061hm44yabgs28xjd8l6m6m8fzm29grgwnn6pwls1mpc";
  };

  buildInputs = [ gtk3 glib json_glib gnome3.rest gnome3.libgee libav libsoup sqlite intltool
		  vala gst_all_1.gstreamer gst_all_1.gst-plugins-base gst_all_1.gst-plugins-good
		  gst_all_1.gst-plugins-bad ];

  meta = with stdenv.lib; {
    description = "A GTK twitter client";
    repositories.git = https://github.com/baedert/corebird.git;
    license = "GPL";
  };
}

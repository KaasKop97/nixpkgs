{ stdenv, intltool, fetchurl, wrapGAppsHook, gnome-video-effects, libcanberra_gtk3
, pkgconfig, gtk3, glib, clutter_gtk, clutter-gst, udev, gst_all_1, itstool
, libgudev, vala, appstream-glib
, adwaita-icon-theme, librsvg, gdk_pixbuf, gnome3, gnome_desktop, libxml2 }:

stdenv.mkDerivation rec {
  inherit (import ./src.nix fetchurl) name src;

  nativeBuildInputs = [
    pkgconfig intltool itstool vala wrapGAppsHook libxml2 appstream-glib
  ];
  buildInputs = [ gtk3 glib gnome-video-effects
                  gdk_pixbuf adwaita-icon-theme librsvg udev gst_all_1.gstreamer
                  gst_all_1.gst-plugins-base gst_all_1.gst-plugins-good gnome_desktop
                  gst_all_1.gst-plugins-bad clutter_gtk clutter-gst
                  libcanberra_gtk3 libgudev ];

  enableParallelBuilding = true;

  meta = with stdenv.lib; {
    homepage = https://wiki.gnome.org/Apps/Cheese;
    description = "Take photos and videos with your webcam, with fun graphical effects";
    maintainers = gnome3.maintainers;
    license = licenses.gpl3;
    platforms = platforms.linux;
  };
}

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    cargo
    rustc
    deno
  ];

  buildInputs = with pkgs; [
    webkitgtk_4_1
    gtk3
    libsoup_3
    openssl
    libusb1
    udev
    libayatana-appindicator
  ];

  shellHook = ''
    export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath (with pkgs; [
      libayatana-appindicator
      gtk3
      webkitgtk_4_1
      libsoup_3
      openssl
      libusb1
      udev
    ])}:$LD_LIBRARY_PATH"
  '';
}

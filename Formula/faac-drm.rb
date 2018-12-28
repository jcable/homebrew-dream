class FaacDrm < Formula
  desc "ISO AAC audio encoder with Digital Radio Mondiale support"
  homepage "https://www.audiocoding.com/faac.html"
  url "https://downloads.sourceforge.net/project/faac/faac-src/faac-1.28/faac-1.28.tar.gz"
  sha256 "c5141199f4cfb17d749c36ba8cfe4b25f838da67c22f0fec40228b6b9c3d19df"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--without-mp4v2",
                          "--enable-drm",
                          "--enable-shared"
    system "make"
    mv "libfaac/.libs/libfaac.a", "libfaac/.libs/libfaac_drm.a"
    mv "libfaac/.libs/libfaac.0.0.0.dylib", "libfaac/.libs/libfaac_drm.0.0.0.dylib"
    mv "libfaac/.libs/libfaac.0.dylib", "libfaac/.libs/libfaac_drm.0.dylib"
    lib.install "libfaac/.libs/libfaac_drm.a"
    lib.install "libfaac/.libs/libfaac_drm.0.0.0.dylib"
    lib.install "libfaac/.libs/libfaac_drm.0.dylib"
    lib.install_symlink "libfaac_drm.0.dylib" => "libfaac_drm.dylib"
  end

  test do
    assert_predicate lib/"libfaac_drm.a", :exist?
  end
end

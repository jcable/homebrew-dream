class HamlibAT33 < Formula
  desc "Ham radio control libraries"
  homepage "http://www.hamlib.org/"
  url "https://github.com/Hamlib/Hamlib/releases/download/3.3/hamlib-3.3.tar.gz"
  sha256 "c90b53949c767f049733b442cd6e0a48648b55d99d4df5ef3f852d985f45e880"
  license "LGPL-2.1-or-later"
  head "https://github.com/hamlib/hamlib.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "pkg-config" => :build
  depends_on "libtool"
  depends_on "libusb-compat"

  def install
    system "./bootstrap" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/rigctl", "-V"
  end
end

class Hamlib < Formula
  desc "Ham radio control library"
  homepage "https://hamlib.sourceforge.io/"
  url "https://github.com/Hamlib/Hamlib/releases/download/3.2/hamlib-3.2.tar.gz"
  sha256 "b55cb5e6a8e876cceb86590c594ea5a6eb5dff2e30fc13ce053b46baa6d7ad1d"

  depends_on "pkg-config" => :build
  depends_on "libtool"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/rigctl", "-V"
  end
end

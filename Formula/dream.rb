# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dream < Formula
  desc ""
  homepage ""
  url "https://sourceforge.net/projects/drm/files/dream/2.2/dream_2.2.orig.tar.gz"
  sha256 "e119e46c0373256544cc86f0125446cb849708f8"
  depends_on "qt5"
  #depends_on "qtwebengine"
  depends_on "qwt"
  depends_on "fftw"
  depends_on "opus"
  depends_on "libsndfile"
  depends_on "pulseaudio"
  depends_on "speexdsp"
  depends_on "hamlib"
  depends_on "fdk-aac"

  def install
    system "qmake"
    system "make"
    prefix.install "dream.app"
  end

  test do
    system "true"
  end
end

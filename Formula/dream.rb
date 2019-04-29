# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dream < Formula
  desc ""
  homepage ""
  url "https://sourceforge.net/projects/drm/files/dream/2.2/dream_2.2.orig.tar.gz"
  sha256 "55dc5ad9cb489851496b50a286d1398709dcb4e2f3808954176d6b6cb9c1244a"
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

# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dream < Formula
  desc ""
  homepage ""
  url "https://sourceforge.net/projects/drm/files/dream/2.2/dream_2.2.orig.tar.gz"
  sha256 "f7211ee3c19b42116b6d1f999d45007c1a9e62fee92906aa37d56eb00219ef56"
  depends_on "qt5"
  #depends_on "qtwebengine"
  depends_on "qwt" => "6.1.6"
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

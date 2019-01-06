# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Dream < Formula
  desc ""
  homepage ""
  url "https://sourceforge.net/projects/drm/files/dream/SNAPSHOTS/dream-svn1077/dream-svn1077.tar.gz"
  sha256 "1f105b16da7b7ed134261453e461ee9aafa5680a07e42c6ad3a2cf17c73a14f6"
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

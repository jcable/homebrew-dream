class Qtwebengine < Formula
  desc "Qt WebEngine"
  homepage "http://code.qt.io/cgit/qt/qtwebengine.git/"
  url "https://github.com/qt/qtwebengine/archive/v5.11.2.tar.gz"
  sha256 "ca545f1f3a401246ec6a9edd06a5bbe1302e590282277e5eb4035d70fd472d29"

  def install
    system "qmake", "macx-clang"
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"test.cpp").write <<~EOS
    #include <QGuiApplication>
    #include <QQmlApplicationEngine>
    #include <qtwebengineglobal.h>

    int main(int argc, char *argv[])
    {
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
        QGuiApplication app(argc, argv);

        QtWebEngine::initialize();

        QQmlApplicationEngine engine;
        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

        return app.exec();
    }
EOS
    system ENV.cxx, "test.cpp", "-o", "out",
      "-std=c++11",
      "-framework", "QtWebEngine", "-framework", "QtCore",
      "-F#{lib}", "-F#{Formula["qt"].opt_lib}",
      "-I#{lib}/qwt.framework/Headers",
      "-I#{Formula["qt"].opt_lib}/QtCore.framework/Versions/5/Headers",
      "-I#{Formula["qt"].opt_lib}/QtGui.framework/Versions/5/Headers"
    system "./out"
  end
end
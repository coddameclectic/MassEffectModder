QT += core gui widgets

CONFIG += c++14 static precompile_header
CONFIG -= app_bundle

TARGET = MassEffectModder

TEMPLATE = app

SOURCES += Main.cpp \
    Exceptions/SignalHandler.cpp \
    Gui/MainWindow.cpp \
    Gui/LayoutMeSelect.cpp \
    Helpers/Misc.cpp \
    Helpers/FileStream.cpp \
    Helpers/MemoryStream.cpp \
    Logs/Logs.cpp \
    ConfigIni.cpp

PRECOMPILED_HEADER = Precompiled.h

HEADERS += \
    Exceptions/Backtrace.h \
    Exceptions/SignalHandler.h \
    Gui/MainWindow.h \
    Gui/LayoutMeSelect.h \
    Helpers/Misc.h \
    Helpers/FileStream.h \
    Helpers/MemoryStream.h \
    Helpers/Stream.h \
    Logs/Logs.h \
    ConfigIni.h \
    Version.h

DEFINES += QT_DEPRECATED_WARNINGS

precompile_header:!isEmpty(PRECOMPILED_HEADER) {
    DEFINES += USING_PCH
}

QMAKE_CXXFLAGS += -fopenmp -g

macx {
    # macOS clang doesn't have OpenMP enabled
    # we need provide version with enabled
    QMAKE_CC  = /usr/local/opt/llvm/bin/clang
    QMAKE_CXX = /usr/local/opt/llvm/bin/clang++

    # WA: PCH file clash with targer file name
    PRECOMPILED_DIR = ".pch"

    SOURCES += Exceptions/BacktraceMac.cpp
}

win32 {
    SOURCES += Exceptions/BacktraceWin.cpp
    LIBS += -lbfd -liberty -limagehlp -lintl -liconv -lz

    # WA: this bad. Assuming Qtcreator/project is on the same disk as msys2.
    # And assuming msys64 is main directory of msys2 64bit installation.
    # It should be /mingw64/lib/binutils but doesn't work in Qt env.
    QMAKE_LIBDIR += /msys64/mingw64/lib/binutils
}

linux {
    # WA: PCH file clash with targer file name
    PRECOMPILED_DIR = ".pch"

    # backtrace require compile with 'dynamic' flag
    QMAKE_LFLAGS += -rdynamic

    SOURCES += Exceptions/BacktraceLin.cpp
}

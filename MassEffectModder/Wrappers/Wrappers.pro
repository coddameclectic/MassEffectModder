TEMPLATE = lib
CONFIG += staticlib

QT -= gui core

SOURCES += \
    Wrapper7Zip.cpp \
    WrapperLzo.cpp \
    WrapperPng.cpp \
    WrapperUnzip.cpp \
    WrapperUnrar.cpp \
    WrapperXdelta.cpp \
    WrapperZlib.cpp \
#    WrapperZstd.cpp

HEADERS += Wrappers.h

QMAKE_CXXFLAGS +=
QMAKE_CXXFLAGS_RELEASE += -g1
QMAKE_CXXFLAGS_DEBUG += -g

DEFINES +=

win32-g++: {
    Release:PRE_TARGETDEPS += \
    $$OUT_PWD/../Libs/7z/release/lib7z.a \
    $$OUT_PWD/../Libs/dxtc/release/libdxtc.a \
    $$OUT_PWD/../Libs/lzo2/release/liblzo2.a \
    $$OUT_PWD/../Libs/png/release/libpng.a \
    $$OUT_PWD/../Libs/xdelta3/release/libxdelta3.a \
    $$OUT_PWD/../Libs/zlib/release/libzlib.a \
#    $$OUT_PWD/../Libs/zstd/release/libzstd.a \
    $$OUT_PWD/../Libs/unrar/release/libunrar.a
    Debug:PRE_TARGETDEPS += \
    $$OUT_PWD/../Libs/7z/debug/lib7z.a \
    $$OUT_PWD/../Libs/dxtc/debug/libdxtc.a \
    $$OUT_PWD/../Libs/lzo2/debug/liblzo2.a \
    $$OUT_PWD/../Libs/png/debug/libpng.a \
    $$OUT_PWD/../Libs/xdelta3/debug/libxdelta3.a \
    $$OUT_PWD/../Libs/zlib/debug/libzlib.a \
#    $$OUT_PWD/../Libs/zstd/debug/libzstd.a \
    $$OUT_PWD/../Libs/unrar/debug/libunrar.a
} else:unix: {
    PRE_TARGETDEPS += \
    $$OUT_PWD/../Libs/7z/lib7z.a \
    $$OUT_PWD/../Libs/dxtc/libdxtc.a \
    $$OUT_PWD/../Libs/lzo2/liblzo2.a \
    $$OUT_PWD/../Libs/png/libpng.a \
    $$OUT_PWD/../Libs/xdelta3/libxdelta3.a \
    $$OUT_PWD/../Libs/zlib/libzlib.a \
#    $$OUT_PWD/../Libs/zstd/libzstd.a \
    $$OUT_PWD/../Libs/unrar/libunrar.a
}

INCLUDEPATH += \
    $$PWD/../Libs/7z \
    $$PWD/../Libs/dxtc \
    $$PWD/../Libs/lzo2 \
    $$PWD/../Libs/png \
    $$PWD/../Libs/xdelta3 \
    $$PWD/../Libs/zlib \
#    $$PWD/../Libs/zstd \
    $$PWD/../Libs/unrar

DEPENDPATH += \
    $$PWD/../Libs/7z \
    $$PWD/../Libs/dxtc \
    $$PWD/../Libs/lzo2 \
    $$PWD/../Libs/png \
    $$PWD/../Libs/xdelta3 \
    $$PWD/../Libs/zlib \
#    $$PWD/../Libs/zstd \
    $$PWD/../Libs/unrar

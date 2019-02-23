TEMPLATE = subdirs

CONFIG += ordered

GUI_MODE = true
cache(GUI_MODE, set)

SUBDIRS += \
    Libs/7z \
    Libs/dxtc \
    Libs/lzo2 \
    Libs/png \
    Libs/xdelta3 \
    Libs/zlib \
    Libs/zstd \
    Libs/unrar \
    Wrappers \
    MassEffectModder

# This file is part of MXE.
# See index.html for further information.

PKG             := openblas
$(PKG)_IGNORE   :=
$(PKG)_VERSION	:= 0.2.7
$(PKG)_CHECKSUM := 2b957a69e3740332759d3c17cc985ecf77364ce3
$(PKG)_SUBDIR   := OpenBLAS-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/xianyi/OpenBLAS/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := gcc

define $(PKG)_UPDATE
    echo 1
endef

define $(PKG)_BUILD
    $(MAKE) -C '$(1)' -j '$(JOBS)' CC=$(TARGET)-gcc FC=$(TARGET)-gfortran HOSTCC=clang CROSS=1 CROSS_SUFFIX=$(TARGET)- TARGET=PENRYN NO_LAPACK=1 NO_SHARED=1
    $(MAKE) -C '$(1)' install PREFIX='$(PREFIX)/$(TARGET)' NO_LAPACK=1 NO_SHARED=1
endef

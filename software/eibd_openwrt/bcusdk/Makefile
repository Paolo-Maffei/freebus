# Makefile eibd
# $Id$

include $(TOPDIR)/rules.mk

PKG_NAME:=bcusdk
PKG_REV:=3d32c84e7856aa855c6a7ff9f35dd957844771ff
PKG_VERSION:=20100719
#PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=git://bcusdk.git.sourceforge.net/gitroot/bcusdk/bcusdk
PKG_SOURCE_VERSION:=$(PKG_REV)

PKG_BUILD_DEPENDS:=pthsem uclibcxx libxml2 libusb argp-standalone

include $(INCLUDE_DIR)/package.mk

define Package/eibd
 SECTION:=net
 CATEGORY:=Network
 TITLE:=Eib KNX deamon
 URL:=http://www.auto.tuwien.ac.at/~mkoegler/index.php/eibd
 DEPENDS:=pthsem uclibcxx libusb
 MAINTAINER:=Matthias Fechner <idefix@fechner.net>
endef

define Package/bcusdk/description
 Network deamon to access a KNX bus by several interfaces
endef

define Build/Prepare
	$(call Build/Prepare/Default)
endef


define Build/Configure
	( cd $(PKG_BUILD_DIR) && \
	aclocal -I $(BUILD_DIR)/pthsem-2.0.8/ --force -I m4 && \
	libtoolize --force && \
	autoconf --include=$(BUILD_DIR)/pthsem-2.0.8/ --force && \
	autoheader --include=$(BUILD_DIR)/pthsem-2.0.8/ --force && \
	automake -a --foreign --add-missing --copy --force-missing && \
	$(SED) 's,^.*either a special installation or a Pth source tree.*,_pth_cppflags=\"-I$(BUILD_DIR)/pthsem-2.0.8"\n_pth_cflags=\"-I$(BUILD_DIR)/pthsem-2.0.8"\n_pth_ldflags=\"-L$(BUILD_DIR)/pthsem-2.0.8/.libs\"\n,g' $(PKG_BUILD_DIR)/configure \
	)
	$(call Build/Configure/Default,\
		--verbose \
		--with-pth=$(BUILD_DIR)/pthsem-2.0.8 \
		--enable-onlyeibd \
		--enable-ft12 \
		--enable-eibnetip \
		--enable-eibnetiptunnel \
		--enable-eibnetipserver \
		--enable-tpuart \
		--enable-tpuarts \
		--disable-pei16 \
		--disable-pei16s \
		--enable-groupcache \
		--without-pth-test)
endef

define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR)
endef

define Package/eibd/install
	mkdir -p $(1)/usr/bin
	$(CP) $(PKG_BUILD_DIR)/eibd/server/eibd $(1)/usr/bin/
	$(CP) $(PKG_BUILD_DIR)/eibd/examples/knxtool $(1)/usr/bin/
	-rm -f $(1)/usr/bin/knxread
	-rm -f $(1)/usr/bin/knxreadtemp
	-rm -f $(1)/usr/bin/knxwrite
	-rm -f $(1)/usr/bin/knxlog
	-rm -f $(1)/usr/bin/knxon
	-rm -f $(1)/usr/bin/knxoff
	-rm -f $(1)/usr/bin/knxif
	-rm -f $(1)/usr/bin/knxswrite
	-rm -f $(1)/usr/bin/knxbool
	-rm -f $(1)/usr/bin/knxdimup
	ln -s knxtool $(1)/usr/bin/knxread
	ln -s knxtool $(1)/usr/bin/knxreadtemp
	ln -s knxtool $(1)/usr/bin/knxwrite
	ln -s knxtool $(1)/usr/bin/knxlog
	ln -s knxtool $(1)/usr/bin/knxon
	ln -s knxtool $(1)/usr/bin/knxoff
	ln -s knxtool $(1)/usr/bin/knxif
	ln -s knxtool $(1)/usr/bin/knxswrite
	ln -s knxtool $(1)/usr/bin/knxbool
	ln -s knxtool $(1)/usr/bin/knxdimup
endef

$(eval $(call RequireHeader,/usr/include/gnu/stubs-32.h,$(PKG_NAME) requires a 32-bits toolchain. ))

$(eval $(call BuildPackage,eibd))


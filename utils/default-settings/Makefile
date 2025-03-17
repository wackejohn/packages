#
# Copyright (C) 2016-2017 GitHub 
#
# This is free software, licensed under the GNU General Public License v3.
# See /LICENSE for more information.

include $(TOPDIR)/rules.mk

PKG_NAME:=default-settings
PKG_VERSION:=1.0
PKG_RELEASE:=29
PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/default-settings
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=Default Settings for Ownbuild
  PKGARCH:=all
endef

define Package/default-settings/description
	Default Settings for Ownbuild.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/default-settings/install
	$(INSTALL_DIR) $(1)/etc/dnsmasq.d
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_DIR) $(1)/etc/mwan3ipset
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/zzz-default-settings $(1)/etc/uci-defaults/99-default-settings
	$(INSTALL_BIN) ./files/DenyPwdHack.sh $(1)/usr/bin/DenyPwdHack.sh
	$(INSTALL_BIN) ./files/mwan3ipset $(1)/etc/init.d/mwan3ipset
	$(INSTALL_BIN) ./files/genipset.sh $(1)/usr/bin/genipset.sh
	$(INSTALL_BIN) ./files/genipset_ipv6.sh $(1)/usr/bin/genipset_ipv6.sh
	$(INSTALL_DATA) ./files/cernet.txt $(1)/etc/mwan3ipset/cernet.txt
	$(INSTALL_DATA) ./files/cernet6.txt $(1)/etc/mwan3ipset/cernet6.txt
	$(INSTALL_DATA) ./files/china.txt $(1)/etc/mwan3ipset/china.txt
	$(INSTALL_DATA) ./files/china6.txt $(1)/etc/mwan3ipset/china6.txt
	$(INSTALL_DATA) ./files/chinanet.txt $(1)/etc/mwan3ipset/chinanet.txt
	$(INSTALL_DATA) ./files/chinanet6.txt $(1)/etc/mwan3ipset/chinanet6.txt
	$(INSTALL_DATA) ./files/cmcc.txt $(1)/etc/mwan3ipset/cmcc.txt
	$(INSTALL_DATA) ./files/cmcc6.txt $(1)/etc/mwan3ipset/cmcc6.txt
	$(INSTALL_DATA) ./files/cstnet.txt $(1)/etc/mwan3ipset/cstnet.txt
	$(INSTALL_DATA) ./files/cstnet6.txt $(1)/etc/mwan3ipset/cstnet6.txt
	$(INSTALL_DATA) ./files/drpeng.txt $(1)/etc/mwan3ipset/drpeng.txt
	$(INSTALL_DATA) ./files/drpeng6.txt $(1)/etc/mwan3ipset/drpeng6.txt
	$(INSTALL_DATA) ./files/googlecn.txt $(1)/etc/mwan3ipset/googlecn.txt
	$(INSTALL_DATA) ./files/googlecn6.txt $(1)/etc/mwan3ipset/googlecn6.txt
	$(INSTALL_DATA) ./files/tietong.txt $(1)/etc/mwan3ipset/tietong.txt
	$(INSTALL_DATA) ./files/tietong6.txt $(1)/etc/mwan3ipset/tietong6.txt
	$(INSTALL_DATA) ./files/unicom.txt $(1)/etc/mwan3ipset/unicom.txt
	$(INSTALL_DATA) ./files/unicom6.txt $(1)/etc/mwan3ipset/unicom6.txt
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
	po2lmo ./po/zh_Hans/default.po $(1)/usr/lib/lua/luci/i18n/default.zh-cn.lmo
endef


$(eval $(call BuildPackage,default-settings))

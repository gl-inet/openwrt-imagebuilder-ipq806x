
include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD:=ipq807x
BOARDNAME:=Qualcomm Atheros IPQ807X
FEATURES:=squashfs nand ubifs
CPU_TYPE:=cortex-a53

KERNELNAME:=Image dtbs

LINUX_SRC_VERSION:=$(shell basename $(TOPDIR)/qca/src/linux-*.* | sed 's/[^0-9.]*\([0-9.]*\).*/\1/')
# check .config for an overridden Linux dir, otherwise use qca/src/linux
CONFIG_EXTERNAL_KERNEL_TREE=$(shell \
	grep -q CONFIG_EXTERNAL_KERNEL_TREE="[^\/]*.\/" $(TOPDIR)/.config && \
	sed -n 's,CONFIG_EXTERNAL_KERNEL_TREE="\(.*\)",\1,p' $(TOPDIR)/.config || \
	echo '$(TOPDIR)/qca/src/linux-$(LINUX_SRC_VERSION)')


ifneq ($(CONFIG_EXTERNAL_KERNEL_TREE),"")
  $(eval _LINUX_DIR:=$(CONFIG_EXTERNAL_KERNEL_TREE))
  $(shell touch $(_LINUX_DIR)/.scmversion)
  _LINUX_MAJOR:=$(shell sed -n 's,VERSION = \([0-9]*\)$$,\1,p' $(_LINUX_DIR)/Makefile)
  _LINUX_MINOR:=$(shell sed -n 's,PATCHLEVEL = \([0-9]*\)$$,\1,p' $(_LINUX_DIR)/Makefile)
  _LINUX_SUBLEVEL:=$(shell sed -n 's,SUBLEVEL = \([0-9]*\)$$,\1,p' $(_LINUX_DIR)/Makefile)
  _LINUX_EXTRAVERSION:=$(shell sed -n 's,EXTRAVERSION = \([-rc0-9]*\)$$,\1,p' $(_LINUX_DIR)/Makefile)
  LINUX_VERSION:=$(_LINUX_MAJOR).$(_LINUX_MINOR)$(if $(_LINUX_SUBLEVEL),.$(_LINUX_SUBLEVEL))$(if $(_LINUX_EXTRAVERSION),$(_LINUX_EXTRAVERSION))
else
  LINUX_VERSION:=4.4-rc6
endif

include $(INCLUDE_DIR)/target.mk
DEFAULT_PACKAGES += \
	kmod-leds-gpio kmod-gpio-button-hotplug swconfig \
	kmod-ata-core kmod-ata-ahci kmod-ata-ahci-platform \
	kmod-usb3 kmod-usb-dwc3-qcom kmod-usb-phy-qcom-dwc3 \
	kmod-usb-dwc3-of-simple kmod-usb-phy-ipq807x

$(eval $(call BuildTarget))


SUBTARGET:=ipq807x
BOARDNAME:=QCA IPQ807x(32bit) based boards
CPU_TYPE:=cortex-a7

DEFAULT_PACKAGES += \
	uboot-ipq807x kmod-usb-phy-ipq807x

define Target/Description
	Build firmware image for IPQ807x SoC devices.
endef

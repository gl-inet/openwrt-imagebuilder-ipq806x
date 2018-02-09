
SUBTARGET:=ipq40xx
BOARDNAME:=QCA IPQ40xx based boards
CPU_TYPE:=cortex-a7

DEFAULT_PACKAGES += \
	uboot-ipq40xx lk-ipq40xx kmod-usb-dwc3-ipq40xx kmod-usb-phy-dwc3-ipq4019

define Target/Description
	Build firmware image for IPQ40xx SoC devices.
endef


SUBTARGET:=ipq806x
BOARDNAME:=QCA IPQ806x based boards
CPU_TYPE:=cortex-a7

DEFAULT_PACKAGES += \
	uboot-ipq806x lk-ipq806x uboot-ipq806x-fwupgrade-tools \
	kmod-usb-dwc3-qcom kmod-usb-phy-qcom-dwc3 kmod-usb-dwc3-of-simple

define Target/Description
	Build firmware image for IPQ806x SoC devices.
endef



WIFI_11_0_PKGS:=kmod-qca-wifi-11.0-unified-profile \
	qca-hostap-11.0 qca-hostapd-cli-11.0 qca-wpa-supplicant-11.0 \
	qca-wpa-cli-11.0 qca-spectral-11.0 qca-wpc-10.4 sigma-dut-10.4 \
	qcmbr-10.4 qca-wrapd-11.0 qca-wapid qca-acfg-11.0 whc whc-ui \
	qca-lowi qca-iface-mgr-10.4

WIFI_10_4_FW_PKGS:=qca-wifi-fw-hw2-10.4-asic qca-wifi-fw-hw4-10.4-asic \
	qca-wifi-fw-hw3-10.4-asic qca-wifi-fw-hw6-10.4-asic \
	qca-wifi-fw-hw5-10.4-asic qca-wifi-fw-hw11-10.4-asic

OPENWRT_STANDARD:= \
	luci openssl-util

STORAGE:=kmod-scsi-core kmod-usb-storage kmod-nls-cp437 kmod-nls-iso8859-1  \
	kmod-fs-msdos kmod-fs-vfat kmod-fs-ntfs ntfs-3g e2fsprogs

USB_ETHERNET:= kmod-usb-net-rtl8152 kmod-usb-net

TEST_TOOLS:=sysstat ethtool i2c-tools

UTILS:=file luci-app-samba iperf rng-tools

COREBSP_UTILS:=pm-utils qca-thermald-10.4

AUDIO:=kmod-sound-soc-ipq alsa


NETWORKING:=mcproxy -dnsmasq dnsmasq-dhcpv6 bridge ip-full trace-cmd \
	rp-pppoe-relay iptables-mod-extra iputils-tracepath iputils-tracepath6 \
	kmod-nf-nathelper-extra kmod-ipt-nathelper-rtsp \
	luci-app-upnp luci-app-ddns luci-proto-ipv6 \
	luci-app-multiwan

CD_ROUTER:=kmod-ipt-ipopt kmod-bonding kmod-nat-sctp lacpd \
	arptables ds-lite 6rd ddns-scripts xl2tpd \
	quagga quagga-ripd quagga-zebra quagga-watchquagga quagga-vtysh \
	kmod-ipv6 ip6tables iptables-mod-ipsec iptables-mod-filter \
	isc-dhcp-relay-ipv4 isc-dhcp-relay-ipv6 \
	rp-pppoe-server ppp-mod-pptp

KPI:=iperf sysstat

SWITCH_SSDK_NOHNAT_PKGS:= kmod-qca-ssdk-nohnat qca-ssdk-shell

NSS_COMMON:= \
	kmod-qca-nss-dp \
	kmod-qca-nss-drv \
	qca-nss-fw-hk-retail

define Profile/QSDK_Standard_64
	NAME:=Qualcomm-Atheros SDK Standard_64 Profile
	PACKAGES:=$(OPENWRT_STANDARD) \
		$(WIFI_11_0_PKGS) qca-wifi-fw-hw2-10.4-asic $(NETWORKING) \
		$(STORAGE) $(COREBSP_UTILS) $(UTILS) $(TEST_TOOLS) $(KPI) \
		$(SWITCH_SSDK_NOHNAT_PKGS) $(NSS_COMMON) kmod-art2 \
		qca-wifi-hk-fw-hw1-10.4-asic $(AUDIO) $(CD_ROUTER) -lacpd \
		-isc-dhcp-relay-ipv4 -isc-dhcp-relay-ipv6
endef

define Profile/QSDK_Standard_64/Description
	QSDK Standard_64 package set configuration.
	Enables wifi open source packages
endef

$(eval $(call Profile,QSDK_Standard_64))

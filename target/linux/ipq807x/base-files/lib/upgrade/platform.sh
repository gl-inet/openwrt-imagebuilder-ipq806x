#!/bin/sh
#
# Copyright (c) 2016, The Linux Foundation. All rights reserved
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

. /lib/ipq807x.sh

PART_NAME=firmware

platform_check_image() {
	local board=$(ipq807x_board_name)

	case "$board" in
	HWK01)
		nand_do_platform_check $board $1
		return $?;
		;;
	*)
		return 1;
	esac
}

platform_pre_upgrade() {
	local board=$(ipq807x_board_name)

	case "$board" in
	HWK01)
		nand_do_upgrade "$1"
		;;
	esac
}

# use default for platform_do_upgrade()

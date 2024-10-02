#!/bin/bash
#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/etc/init/nxp.android.hardware.nfc@1.1-service.samsung.rc)
            [ "$2" = "" ] && return 0
            sed -i "s/nxp.android.hardware.nfc@1.1-service/nxp.android.hardware.nfc@1.1-service.samsung/" "${2}"
            ;;
    esac

    return 0
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=a71
export DEVICE_COMMON=a71-common
export VENDOR=samsung

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

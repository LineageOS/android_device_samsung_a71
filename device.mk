#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a71

# Inherit Common Device Tree
$(call inherit-product, device/samsung/a71-common/common.mk)

# Audio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/etc/mixer_paths_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp.xml \

# Fingerprint
TARGET_HAS_UDFPS := true

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/etc/nfc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/nfc/libnfc-nxp_RF.conf \
    $(DEVICE_PATH)/rootdir/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/rootdir/vendor/etc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    $(DEVICE_PATH)/rootdir/vendor/etc/libnfc-nxp_RF.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp_RF.conf \

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \

# Ramdisk
PRODUCT_PACKAGES += \
    init.a71.rc \

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    hardware/nxp/nfc/pn8x \

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/a71/a71-vendor.mk)

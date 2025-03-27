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

# Camera firmware symlinks
PRODUCT_PACKAGES += \
    com.samsung.sensormodule.0_0_lsi_s5kgw1s_new.bin_symlink \
    com.samsung.sensormodule.0_0_lsi_s5kgw1s_old.bin_symlink \
    com.samsung.sensormodule.0_1_sony_imx682.bin_symlink \
    com.samsung.sensormodule.1_sony_imx616.bin_symlink \
    com.samsung.sensormodule.2_hynix_hi1336.bin_symlink \
    com.samsung.sensormodule.3_lsi_gc5035.bin_symlink \
    com.samsung.sensormodule.4_lsi_gc5035_macro.bin_symlink \
    com.samsung.sensormodule.8_sony_imx616_full.bin_symlink \
    com.samsung.tuned.hynix_hi1336.bin_symlink \
    com.samsung.tuned.lsi_gc5035.bin_symlink \
    com.samsung.tuned.lsi_gc5035_macro.bin_symlink \
    com.samsung.tuned.lsi_s5kgw1s.bin_symlink \
    com.samsung.tuned.sony_imx616.bin_symlink \
    com.samsung.tuned.sony_imx682.bin_symlink \

# Fingerprint
TARGET_HAS_UDFPS := true

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/etc/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    $(DEVICE_PATH)/rootdir/vendor/etc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \

# Ramdisk
PRODUCT_PACKAGES += \
    init.a71.rc \

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \

# Get non-open-source specific aspects
$(call inherit-product, vendor/samsung/a71/a71-vendor.mk)

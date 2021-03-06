#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/lge/geefhd/geefhd-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS := device/lge/geefhd_att_us/overlay

PRODUCT_PACKAGES += \
	libbt-vendor

# Inherit from geefhd-common
$(call inherit-product, device/lge/geefhd-common/geefhd-common.mk)

# Enable for debugging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    persist.service.adb.enable=1 \
	persist.sys.strictmode.visual=0 \
	persist.sys.strictmode.disable=true

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# Vold configuration
PRODUCT_COPY_FILES += \
    device/lge/geefhd_att_us/vold.fstab:system/etc/vold.fstab

# GPS configuration
PRODUCT_COPY_FILES += \
        device/lge/geefhd_att_us/configs/gps.conf:system/etc/gps.conf

# BT configuration	
PRODUCT_COPY_FILES += \
        device/lge/geefhd_att_us/configs/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf 
	
# Ramdisk
PRODUCT_COPY_FILES += \
    device/lge/geefhd_att_us/ramdisk/init.geefhd_att_us.rc:root/init.geefhd_att_us.rc \
    device/lge/geefhd_att_us/ramdisk/ueventd.geefhd_att_us.rc:root/ueventd.geefhd_att_us.rc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

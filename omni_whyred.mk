#
# Copyright 2017 The Android Open Source Project
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

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
     $(LOCAL_PATH)

# Inherit some base bare-bone configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/pb/config/common.mk)

# Inherit libart props
$(call inherit-product, $(SRC_TARGET_DIR)/product/runtime_libart.mk)
# Inherit all the languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_default.mk)

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_COPY_FILES += $(call find-copy-subdir-files,*,$(LOCAL_PATH)/recovery/root,recovery/root)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := whyred
PRODUCT_NAME := omni_whyred
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Xiaomi Redmi Note 5 Pro
PRODUCT_MANUFACTURER := Xiaomi

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.allow.mock.location=0 \
    ro.hardware.keystore=sdm660

# Blacklist Properties
PRODUCT_SYSTEM_PROPERTY_BLACKLIST += \
    ro.build.date \
    ro.build.date.utc

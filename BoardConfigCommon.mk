BOARD_VENDOR := amazon
DEVICE_COMMON := device/amazon/mt8163-common
LINEAGE_VERSION := 16.0

# Audio Configurations
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_COMMON)/include

# Bootloader
TARGET_NO_BOOTLOADER := true




#Arch
TARGET_ARCH := arm
TARGET_CPU_VARIANT := cortex-a7
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a7
TARGET_CPU_VARIANT:= cortex-a7
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_USES_64_BIT_BINDER := true





ifeq ($(TARGET_DEVICE),karnak)
# Partitions informations
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_PARTITION_SIZE := 524288000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3253731328
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11633933824
endif
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := false


#Kernel
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00000000 --ramdisk_offset 0x03400000 --second_offset 0x00e80000 --tags_offset 0x07f80000
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x40080000
BOARD_KERNEL_OFFSET := 0
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 131072


#wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := mt66xx
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:=STA
WIFI_DRIVER_FW_PATH_AP:=AP
WIFI_DRIVER_FW_PATH_STA:=P2P





# MTK Common stuff
TARGET_BOARD_PLATFORM := mt8163
BOARD_USES_MTK_AUDIO := true
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
MTK_APPENDED_DTB_SUPPORT := yes
BOARD_USES_MTK_HARDWARE := true



# Bootanimation
TARGET_BOOTANIMATION_MULTITHREAD_DECODE := true
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true




# Camera
USE_CAMERA_STUB := true


#bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_COMMON)/bluetooth
BOARD_HAS_BLUETOOTH := true

# Display
BOARD_EGL_CFG := $(DEVICE_COMMON)/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_OVERLAY := true
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 1024*1024
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true



BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -DMTK_HARDWARE -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DREFRESH_RATE=60
COMMON_GLOBAL_CFLAGS += -DAMAZON_LOG -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD



# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true

#Use dlmalloc instead of jemalloc for mallocs
MALLOC_SVELTE := true


#TWRP COMMON
ifneq (,$(strip $(wildcard bootable/recovery-twrp/twrp.cpp)))
RECOVERY_VARIANT := twrp
endif
BOARD_HAS_NO_SELECT_BUTTON := true
TW_THEME := portrait_hdpi
TARGET_RECOVERY_FSTAB := $(DEVICE_COMMON)/rootdir/recovery.fstab
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone2/temp
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_USE_SYSTEM_VOLD := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_DEFAULT_BRIGHTNESS := 128
TW_AMONET := true


#vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun0/file

#BACKLIGHTS
TARGET_PROVIDES_LIBLIGHT := true

#system Prop
TARGET_SYSTEM_PROP += $(DEVICE_COMMON)/system.prop

#SENSORS
TARGET_NO_SENSOR_PERMISSION_CHECK := true


# Webkit
ENABLE_WEBGL := true
TARGET_FORCE_CPU_UPLOAD := true

# Libshims
TARGET_LD_SHIM_LIBS := \
/system/lib/libasp.so|libshim_asp.so \
/system/lib/hw/amzn_drmprov.mt8163.so|libshim_asp.so \
/system/vendor/lib/egl/libGLES_mali.so|libshim_egl.so \
/system/vendor/lib/libgui_ext.so|libshim_ui.so 


# extras
WITHOUT_CHECK_API := true
ALLOW_MISSING_DEPENDENCIES := true

PRODUCT_TAGS += dalvik.gc.type-precise








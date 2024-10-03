#!/bin/bash

# Main path
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source paths
PACKAGE_SETTINGS="../packages/apps/Settings"
PACKAGE_GAMESPACE="../packages/apps/GameSpace"
XIAOMI_DOLBY="../hardware/xiaomi/dolby"
VENDOR_AOSP="../vendor/aosp"

# Patches
PTBR_SETTINGS="$SCRIPT_DIR/patches/Add-pt-rBR-translation-for-Settings.patch"
PTBR_GAMESPACE="$SCRIPT_DIR/patches/Add-pt-rBR-translation-for-GameSpace.patch"
PTBR_DOLBY="$SCRIPT_DIR/patches/Add-pt-rBR-translation-for-Dolby.patch"
NEW_STATUSBAR_ICONS="$SCRIPT_DIR/patches/Enable-the-new-status-bar-icons.patch"

# Apply Patch to Settings
if [ -d "$PACKAGE_SETTINGS" ]; then
    echo "Applying patch to $PACKAGE_SETTINGS..."
    git -C "$PACKAGE_SETTINGS" apply "$PTBR_SETTINGS"
    if [ $? -eq 0 ]; then
        echo "Patch successfully applied to $PACKAGE_SETTINGS"
    else
        echo "Failed to apply patch to $PACKAGE_SETTINGS"
    fi
else
    echo "$PACKAGE_SETTINGS directory not found!"
fi

# Apply patch to Game Space
if [ -d "$PACKAGE_GAMESPACE" ]; then
    echo "Applying patch to $PACKAGE_GAMESPACE..."
    git -C "$PACKAGE_GAMESPACE" apply "$PTBR_GAMESPACE"
    if [ $? -eq 0 ]; then
        echo "Patch successfully applied to $PACKAGE_GAMESPACE"
    else
        echo "Failed to apply patch to $PACKAGE_GAMESPACE"
    fi
else
    echo "$PACKAGE_GAMESPACE directory not found!"
fi


# Apply patch to Dolby
if [ -d "$XIAOMI_DOLBY" ]; then
    echo "Applying patch to $XIAOMI_DOLBY..."
    git -C "$XIAOMI_DOLBY" apply "$PTBR_DOLBY"
    if [ $? -eq 0 ]; then
        echo "Patch successfully applied to $XIAOMI_DOLBY"
    else
        echo "Failed to apply patch to $XIAOMI_DOLBY"
    fi
else
    echo "$XIAOMI_DOLBY directory not found!"
fi

# Apply Patch to vendor aosp
if [ -d "$VENDOR_AOSP" ]; then
    echo "Applying patch to $VENDOR_AOSP..."
    git -C "$VENDOR_AOSP" apply "$NEW_STATUSBAR_ICONS"
    if [ $? -eq 0 ]; then
        echo "Patch successfully applied to $VENDOR_AOSP"
    else
        echo "Failed to apply patch to $VENDOR_AOSP"
    fi
else
    echo "$VENDOR_AOSP directory not found!"
fi


export PATH=$PATH:/opt/android-studio/bin:/opt/android-sdk/platform-tools
export CC="gcc -march=atom"

POST_DEFCONFIG_CMDS="check_defconfig && update_debug_config"
function update_debug_config() {
    ${KERNEL_DIR}/scripts/config --file ${OUT_DIR}/.config \
         -d LTO \
         -d LTO_CLANG \
         -d CFI \
         -d CFI_PERMISSIVE \
         -d CFI_CLANG
    (cd ${OUT_DIR} && \
     make O=${OUT_DIR} $archsubarch CC=${CC} CROSS_COMPILE=${CROSS_COMPILE} olddefconfig)
}


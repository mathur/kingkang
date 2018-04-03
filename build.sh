export ARCH=arm64
export SUBARCH=arm64
export CROSS_COMPILE=aarch64-linux-android-
export CROSS_COMPILE_ARM32=arm-linux-androideabi-

export LOCALVERSION="-kingkang"
export COMPILER_NAME=".Y."

echo 'Cleaning up old files'
rm /media/sf_shared/kingkang/Image.lz4-dtb;
rm /media/sf_shared/kingkang/dtbo;
rm /media/sf_shared/kingkang.zip;

make wahoo_defconfig;
time make ARCH=arm64 SUBARCH=arm64 CROSS_COMPILE=aarch64-linux-android-;
echo 'Build complete'

echo 'Copying over new files'
cp arch/arm64/boot/Image.lz4-dtb /media/sf_shared/kingkang/;
cp arch/arm64/boot/dtbo.img /media/sf_shared/kingkang/dtbo;

echo 'Building zip'
cd /media/sf_shared/kingkang/
zip -r kingkang.zip *;
mv kingkang.zip ../
echo 'Zip located at /media/sf_shared/kingkang.zip'

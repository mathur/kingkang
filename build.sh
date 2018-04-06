export ARCH=arm64;
export SUBARCH=arm64;
export CROSS_COMPILE=aarch64-linux-android-;
export CROSS_COMPILE_ARM32=arm-linux-androideabi-;

export LOCALVERSION="-kang";
export COMPILER_NAME=".Y.";

echo 'Cleaning up old files';
rm /media/sf_shared/kang/Image.lz4-dtb;
rm /media/sf_shared/kang/dtbo;

make kang_defconfig;
time make ARCH=arm64 SUBARCH=arm64 CROSS_COMPILE=aarch64-linux-android-;
echo 'Build complete';

echo 'Copying over new files';
cp arch/arm64/boot/Image.lz4-dtb /media/sf_shared/kang/;
cp arch/arm64/boot/dtbo.img /media/sf_shared/kang/dtbo;

echo 'Building zip';
cd /media/sf_shared/kang/;
zip -r `date "+%Y%m%d-%H%M"`_kang.zip *;
mv `date "+%Y%m%d-%H%M"`_kang.zip ../;

#echo 'Uploading';
#cd ..;
#link=$(curl --upload-file `date "+%Y%m%d-%H%M"`_kang.zip https://transfer.sh/`date "+%Y%m%d-%H%M"`_kang.zip 2>&1);

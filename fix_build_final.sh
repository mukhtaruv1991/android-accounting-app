#!/bin/bash
echo "🔧 الإصلاح النهائي لمشكلة AAPT2..."

# تنظيف كامل
rm -rf ~/.gradle/caches/transforms-3/*
rm -rf ~/.gradle/caches/modules-2/files-2.1/com.android.tools.build
./gradlew clean
rm -rf .gradle build app/build

# إزالة إعدادات AAPT2 القديمة
sed -i '/android.enableAapt2/d' gradle.properties
sed -i '/android.enableAapt2Daemon/d' gradle.properties

# إعادة البناء
./gradlew assembleDebug \
    --no-daemon \
    --console=plain \
    --stacktrace \
    --info

echo "✅ تم الانتهاء"

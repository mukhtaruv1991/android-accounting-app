#!/bin/bash

echo "🎨 الإصلاح الآمن لمشاكل الألوان..."

# التحقق مما إذا كان ملف colors.xml موجود أصلاً
if [ ! -f "app/src/main/res/values/colors.xml" ]; then
    echo "📝 إنشاء ملف colors.xml جديد..."
    mkdir -p app/src/main/res/values
    cat > app/src/main/res/values/colors.xml << 'COLORS'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Colors from Material Design -->
    <color name="purple_200">#FFBB86FC</color>
    <color name="purple_500">#FF6200EE</color>
    <color name="purple_700">#FF3700B3</color>
    <color name="teal_200">#FF03DAC5</color>
    <color name="teal_700">#FF018786</color>
    
    <!-- Basic colors -->
    <color name="black">#FF000000</color>
    <color name="white">#FFFFFFFF</color>
</resources>
COLORS
else
    echo "✅ ملف colors.xml موجود بالفعل - جاري إضافة الألوان المفقودة فقط..."
    
    # إضافة الألوان المفقودة إلى الملف الحالي (بدون حذف المحتوى القديم)
    if ! grep -q "purple_500" app/src/main/res/values/colors.xml; then
        echo "    ➕ إضافة purple_500" >> app/src/main/res/values/colors.xml
    fi
    if ! grep -q "purple_700" app/src/main/res/values/colors.xml; then
        echo "    ➕ إضافة purple_700" >> app/src/main/res/values/colors.xml
    fi
    if ! grep -q "teal_200" app/src/main/res/values/colors.xml; then
        echo "    ➕ إضافة teal_200" >> app/src/main/res/values/colors.xml
    fi
    if ! grep -q "teal_700" app/src/main/res/values/colors.xml; then
        echo "    ➕ إضافة teal_700" >> app/src/main/res/values/colors.xml
    fi
    if ! grep -q "black" app/src/main/res/values/colors.xml; then
        echo "    ➕ إضافة black" >> app/src/main/res/values/colors.xml
    fi
    if ! grep -q "white" app/src/main/res/values/colors.xml; then
        echo "    ➕ إضافة white" >> app/src/main/res/values/colors.xml
    fi
fi

# التحقق من themes.xml
if [ -f "app/src/main/res/values/themes.xml" ]; then
    echo "✅ ملف themes.xml موجود - لا يتم التعديل"
else
    echo "📝 إنشاء ملف themes.xml جديد..."
    cat > app/src/main/res/values/themes.xml << 'THEMES'
<resources xmlns:tools="http://schemas.android.com/tools">
    <style name="Theme.AndroidApp" parent="Theme.Material3.DayNight">
        <item name="colorPrimary">@color/purple_500</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/white</item>
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_700</item>
        <item name="colorOnSecondary">@color/black</item>
    </style>
</resources>
THEMES
fi

echo "✅ تم الإصلاح الآمن!"
echo "📊 حالة الملفات:"
echo "   - colors.xml: $(if [ -f "app/src/main/res/values/colors.xml" ]; then echo "موجود ✅"; else echo "مفقود ❌"; fi)"
echo "   - themes.xml: $(if [ -f "app/src/main/res/values/themes.xml" ]; then echo "موجود ✅"; else echo "مفقود ❌"; fi)"

echo ""
echo "🚀 جاري تجربة البناء..."
./gradlew clean assembleDebug

if [ $? -eq 0 ]; then
    echo "🎉 تم البناء بنجاح!"
else
    echo "❌ لا يزال هناك أخطاء"
    echo "💡 يمكنك محاولة: ./gradlew clean build --stacktrace"
fi

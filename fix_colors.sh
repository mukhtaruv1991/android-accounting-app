#!/bin/bash

echo "🎨 إصلاح مشاكل الألوان المفقودة..."

# إنشاء ملف الألوان المفقودة
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
    
    <!-- Additional common colors -->
    <color name="gray">#FF888888</color>
    <color name="light_gray">#FFCCCCCC</color>
    <color name="dark_gray">#FF444444</color>
    <color name="red">#FFFF0000</color>
    <color name="green">#FF00FF00</color>
    <color name="blue">#FF0000FF</color>
    <color name="yellow">#FFFFFF00</color>
    
    <!-- App specific colors -->
    <color name="primary">#FF6200EE</color>
    <color name="primary_dark">#FF3700B3</color>
    <color name="accent">#FF03DAC5</color>
    <color name="background">#FFFFFFFF</color>
    <color name="surface">#FFFFFFFF</color>
    <color name="on_primary">#FFFFFFFF</color>
    <color name="on_secondary">#FF000000</color>
    <color name="on_background">#FF000000</color>
    <color name="on_surface">#FF000000</color>
    
    <!-- Status colors -->
    <color name="status_active">#FF4CAF50</color>
    <color name="status_inactive">#FFF44336</color>
    <color name="status_pending">#FFFF9800</color>
    <color name="status_draft">#FF9E9E9E</color>
    
    <!-- Light blue for admin -->
    <color name="light_blue">#FFE3F2FD</color>
</resources>
COLORS

# إصلاح ملف themes.xml إذا كان موجوداً
if [ -f "app/src/main/res/values/themes.xml" ]; then
    cat > app/src/main/res/values/themes.xml << 'THEMES'
<resources xmlns:tools="http://schemas.android.com/tools">
    <!-- Base application theme. -->
    <style name="Base.Theme.AndroidApp" parent="Theme.Material3.DayNight">
        <!-- Customize your light theme here. -->
        <item name="colorPrimary">@color/purple_500</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/white</item>
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_700</item>
        <item name="colorOnSecondary">@color/black</item>
        <item name="android:statusBarColor">?attr/colorPrimaryVariant</item>
    </style>

    <style name="Theme.AndroidApp" parent="Base.Theme.AndroidApp" />

    <!-- Dark theme -->
    <style name="Base.Theme.AndroidApp.Dark" parent="Theme.Material3.DayNight.Dark">
        <item name="colorPrimary">@color/purple_200</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/black</item>
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_700</item>
        <item name="colorOnSecondary">@color/black</item>
    </style>
</resources>
THEMES
else
    echo "📝 إنشاء ملف themes.xml..."
    cat > app/src/main/res/values/themes.xml << 'THEMES_NEW'
<resources xmlns:tools="http://schemas.android.com/tools">
    <!-- Base application theme. -->
    <style name="Base.Theme.AndroidApp" parent="Theme.Material3.DayNight">
        <!-- Customize your light theme here. -->
        <item name="colorPrimary">@color/purple_500</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/white</item>
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_700</item>
        <item name="colorOnSecondary">@color/black</item>
        <item name="android:statusBarColor">?attr/colorPrimaryVariant</item>
    </style>

    <style name="Theme.AndroidApp" parent="Base.Theme.AndroidApp" />

    <!-- Dark theme -->
    <style name="Base.Theme.AndroidApp.Dark" parent="Theme.Material3.DayNight.Dark">
        <item name="colorPrimary">@color/purple_200</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/black</item>
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_700</item>
        <item name="colorOnSecondary">@color/black</item>
    </style>
</resources>
THEMES_NEW
fi

# إنشاء ملف night colors إذا كان مفقوداً
mkdir -p app/src/main/res/values-night
cat > app/src/main/res/values-night/themes.xml << 'THEMES_NIGHT'
<resources xmlns:tools="http://schemas.android.com/tools">
    <style name="Base.Theme.AndroidApp" parent="Theme.Material3.DayNight.Dark">
        <item name="colorPrimary">@color/purple_200</item>
        <item name="colorPrimaryVariant">@color/purple_700</item>
        <item name="colorOnPrimary">@color/black</item>
        <item name="colorSecondary">@color/teal_200</item>
        <item name="colorSecondaryVariant">@color/teal_700</item>
        <item name="colorOnSecondary">@color/black</item>
    </style>
</resources>
THEMES_NIGHT

echo "✅ تم إصلاح مشاكل الألوان!"
echo "🎨 الألوان التي تم إنشاؤها:"
echo "   - purple_200, purple_500, purple_700"
echo "   - teal_200, teal_700" 
echo "   - black, white"
echo "   - ألوان إضافية للتطبيق"
echo ""
echo "🚀 جاري بناء التطبيق..."
./gradlew clean build

if [ $? -eq 0 ]; then
    echo "🎉 تم البناء بنجاح!"
else
    echo "❌ لا يزال هناك أخطاء في البناء"
    echo "🔧 جاري محاولة إصلاح إضافي..."
    
    # تنظيف وإعادة بناء
    ./gradlew clean
    ./gradlew assembleDebug
fi

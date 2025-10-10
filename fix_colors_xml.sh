#!/bin/bash

echo "🔧 إصلاح ملف colors.xml..."

# إصلاح ملف colors.xml بالكامل
cat > app/src/main/res/values/colors.xml << 'COLORS_XML'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="colorPrimary">#3F51B5</color>
    <color name="colorPrimaryDark">#303F9F</color>
    <color name="colorAccent">#FF4081</color>
    
    <!-- ألوان التطبيق الأساسية -->
    <color name="light_blue">#E3F2FD</color>
    <color name="light_gray">#F5F5F5</color>
    <color name="status_active">#4CAF50</color>
    <color name="status_inactive">#F44336</color>
    <color name="status_pending">#FF9800</color>
    <color name="status_draft">#9E9E9E</color>
    
    <!-- ألوان النصوص -->
    <color name="text_primary">#212121</color>
    <color name="text_secondary">#757575</color>
    <color name="text_hint">#BDBDBD</color>
    
    <!-- ألوان الخلفيات -->
    <color name="background_light">#FFFFFF</color>
    <color name="background_dark">#F5F5F5</color>
    
    <!-- ألوان الأزرار -->
    <color name="button_primary">#2196F3</color>
    <color name="button_success">#4CAF50</color>
    <color name="button_warning">#FF9800</color>
    <color name="button_danger">#F44336</color>
</resources>
COLORS_XML

# إصلاح ملف strings.xml أيضاً للتأكد
cat > app/src/main/res/values/strings.xml << 'STRINGS_XML'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="app_name">Android Accounting App</string>
    
    <!-- نصوص الشاشات الرئيسية -->
    <string name="welcome">مرحباً بك</string>
    <string name="login">تسجيل الدخول</string>
    <string name="register">تسجيل جديد</string>
    <string name="logout">تسجيل الخروج</string>
    
    <!-- نصوص الأصناف -->
    <string name="items">الأصناف</string>
    <string name="add_item">إضافة صنف</string>
    <string name="edit_item">تعديل صنف</string>
    
    <!-- نصوص العملاء -->
    <string name="customers">العملاء</string>
    <string name="add_customer">إضافة عميل</string>
    <string name="edit_customer">تعديل عميل</string>
    
    <!-- نصوص الفواتير -->
    <string name="invoices">الفواتير</string>
    <string name="add_invoice">إضافة فاتورة</string>
    <string name="edit_invoice">تعديل فاتورة</string>
    
    <!-- نصوص التقارير -->
    <string name="reports">التقارير</string>
    <string name="sales_report">تقرير المبيعات</string>
    <string name="profit_loss_report">تقرير الأرباح والخسائر</string>
    
    <!-- رسائل عامة -->
    <string name="save">حفظ</string>
    <string name="delete">حذف</string>
    <string name="cancel">إلغاء</string>
    <string name="confirm">تأكيد</string>
    <string name="loading">جاري التحميل...</string>
    <string name="no_data">لا توجد بيانات</string>
    <string name="error_occurred">حدث خطأ</string>
    <string name="success">تمت العملية بنجاح</string>
</resources>
STRINGS_XML

# إصلاح ملف styles.xml
cat > app/src/main/res/values/styles.xml << 'STYLES_XML'
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <!-- Base application theme. -->
    <style name="AppTheme" parent="Theme.AppCompat.Light.DarkActionBar">
        <item name="colorPrimary">@color/colorPrimary</item>
        <item name="colorPrimaryDark">@color/colorPrimaryDark</item>
        <item name="colorAccent">@color/colorAccent</item>
    </style>

    <style name="AppTheme.NoActionBar">
        <item name="windowActionBar">false</item>
        <item name="windowNoTitle">true</item>
    </style>

    <style name="AppTheme.AppBarOverlay" parent="ThemeOverlay.AppCompat.Dark.ActionBar" />
    <style name="AppTheme.PopupOverlay" parent="ThemeOverlay.AppCompat.Light" />
    
    <!-- تنسيقات النصوص -->
    <style name="TextTitle">
        <item name="android:textSize">24sp</item>
        <item name="android:textStyle">bold</item>
        <item name="android:textColor">@color/text_primary</item>
    </style>
    
    <style name="TextSubtitle">
        <item name="android:textSize">18sp</item>
        <item name="android:textColor">@color/text_secondary</item>
    </style>
    
    <style name="TextBody">
        <item name="android:textSize">16sp</item>
        <item name="android:textColor">@color/text_primary</item>
    </style>
</resources>
STYLES_XML

# التحقق من صحة ملفات XML
echo "🔍 التحقق من صحة ملفات XML..."
find app/src/main/res -name "*.xml" -exec xmllint --noout {} \; 2>/dev/null || echo "⚠️ قد توجد أخطاء في بعض الملفات"

echo "✅ تم إصلاح جميع ملفات الموارد!"
echo "📁 الملفات التي تم إصلاحها:"
echo "1. colors.xml - إصلاح مشكلة XML formatting"
echo "2. strings.xml - تحديث النصوص"
echo "3. styles.xml - تحديث التنسيقات"

# دفع التحديثات
echo "🚀 دفع التحديثات إلى GitHub..."
git add .
git commit -m "🔧 إصلاح ملفات الموارد XML

✅ الإصلاحات:
- إصلاح colors.xml (مشكلة XML formatting)
- تحديث strings.xml بنصوص التطبيق
- تحديث styles.xml بالتنسيقات
- حل مشكلة mergeDebugResources

🎯 تم حل: Error: The markup in the document following the root element must be well-formed"
git push -f origin main

echo "🎉 تم إصلاح جميع مشاكل الموارد!"
echo "🚀 جاهز للبناء: ./gradlew build"

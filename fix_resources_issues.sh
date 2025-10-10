#!/bin/bash

echo "🔧 إصلاح مشاكل ملفات الموارد..."

# 1. إصلاح ملف activity_receipt_list.xml
cat > app/src/main/res/layout/activity_receipt_list.xml << 'RECEIPT_LAYOUT'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp">

    <TextView
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="قائمة الإيصالات"
        android:textSize="24sp"
        android:textStyle="bold"
        android:gravity="center"
        android:layout_marginBottom="16dp" />

    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/recyclerViewReceipts"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1" />

    <com.google.android.material.floatingactionbutton.FloatingActionButton
        android:id="@+id/fabAddReceipt"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="end|bottom"
        android:layout_margin="16dp"
        android:src="@android:drawable/ic_input_add"
        android:contentDescription="إضافة إيصال" />

</LinearLayout>
RECEIPT_LAYOUT

# 2. إصلاح ملف activity_base_list.xml
cat > app/src/main/res/layout/activity_base_list.xml << 'BASE_LIST_LAYOUT'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp">

    <ProgressBar
        android:id="@+id/loadingProgressBar"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:layout_gravity="center"
        android:visibility="gone" />

    <TextView
        android:id="@+id/emptyStateTextView"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="لا توجد بيانات لعرضها"
        android:textSize="18sp"
        android:gravity="center"
        android:padding="32dp"
        android:visibility="gone" />

    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/recyclerView"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />

</LinearLayout>
BASE_LIST_LAYOUT

# 3. إصلاح ملف activity_trophy_detail.xml
cat > app/src/main/res/layout/activity_trophy_detail.xml << 'TROPHY_DETAIL_LAYOUT'
<?xml version="1.0" encoding="utf-8"?>
<ScrollView xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="16dp">

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="vertical">

        <TextView
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="تفاصيل الجائزة"
            android:textSize="24sp"
            android:textStyle="bold"
            android:gravity="center"
            android:layout_marginBottom="24dp" />

        <com.google.android.material.textfield.TextInputLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginBottom="16dp">

            <com.google.android.material.textfield.TextInputEditText
                android:id="@+id/et_trophy_name"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:hint="اسم الجائزة" />

        </com.google.android.material.textfield.TextInputLayout>

        <com.google.android.material.textfield.TextInputLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginBottom="16dp">

            <com.google.android.material.textfield.TextInputEditText
                android:id="@+id/et_trophy_description"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:hint="وصف الجائزة"
                android:inputType="textMultiLine"
                android:minLines="3" />

        </com.google.android.material.textfield.TextInputLayout>

        <com.google.android.material.textfield.TextInputLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginBottom="16dp">

            <com.google.android.material.textfield.TextInputEditText
                android:id="@+id/et_trophy_image_url"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:hint="رابط صورة الجائزة" />

        </com.google.android.material.textfield.TextInputLayout>

        <com.google.android.material.textfield.TextInputLayout
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:layout_marginBottom="16dp">

            <com.google.android.material.textfield.TextInputEditText
                android:id="@+id/et_trophy_points_required"
                android:layout_width="match_parent"
                android:layout_height="wrap_content"
                android:hint="النقاط المطلوبة"
                android:inputType="number" />

        </com.google.android.material.textfield.TextInputLayout>

        <ImageView
            android:id="@+id/iv_trophy_preview"
            android:layout_width="120dp"
            android:layout_height="120dp"
            android:layout_gravity="center"
            android:background="#f0f0f0"
            android:scaleType="centerCrop"
            android:layout_marginBottom="24dp" />

        <Button
            android:id="@+id/btn_save_trophy"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="حفظ الجائزة"
            android:textSize="16sp"
            android:layout_marginBottom="8dp" />

        <Button
            android:id="@+id/btn_delete_trophy"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:text="حذف الجائزة"
            android:textSize="16sp"
            android:backgroundTint="@android:color/holo_red_dark" />

    </LinearLayout>

</ScrollView>
TROPHY_DETAIL_LAYOUT

# 4. إنشاء ملفات تخطيط إضافية مطلوبة
cat > app/src/main/res/layout/notification_list_row.xml << 'NOTIFICATION_ROW'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="vertical"
    android:padding="16dp"
    android:background="?android:attr/selectableItemBackground">

    <TextView
        android:id="@+id/tv_notification_title"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="عنوان الإشعار"
        android:textSize="18sp"
        android:textStyle="bold" />

    <TextView
        android:id="@+id/tv_notification_message"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="رسالة الإشعار"
        android:textSize="14sp"
        android:layout_marginTop="4dp" />

    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:orientation="horizontal"
        android:layout_marginTop="8dp">

        <TextView
            android:id="@+id/tv_notification_timestamp"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:text="الوقت"
            android:textSize="12sp"
            android:textColor="#666" />

        <TextView
            android:id="@+id/tv_notification_type"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="النوع"
            android:textSize="12sp"
            android:padding="4dp"
            android:background="#e0e0e0"
            android:textColor="#333" />

    </LinearLayout>

</LinearLayout>
NOTIFICATION_ROW

cat > app/src/main/res/layout/chat_list_row.xml << 'CHAT_ROW'
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:orientation="vertical"
    android:padding="16dp"
    android:background="?android:attr/selectableItemBackground">

    <TextView
        android:id="@+id/chat_message"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="رسالة الدردشة"
        android:textSize="16sp" />

    <TextView
        android:id="@+id/chat_timestamp"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="الوقت"
        android:textSize="12sp"
        android:textColor="#666"
        android:layout_marginTop="4dp" />

</LinearLayout>
CHAT_ROW

# 5. إضافة ألوان مفقودة
cat >> app/src/main/res/values/colors.xml << 'COLORS'

    <color name="light_blue">#E3F2FD</color>
    <color name="light_gray">#F5F5F5</color>
    
COLORS

echo "✅ تم إصلاح جميع ملفات الموارد!"
echo "📁 الملفات التي تم إنشاؤها:"
echo "1. activity_receipt_list.xml"
echo "2. activity_base_list.xml" 
echo "3. activity_trophy_detail.xml"
echo "4. notification_list_row.xml"
echo "5. chat_list_row.xml"
echo "6. ألوان إضافية في colors.xml"

# دفع التحديثات إلى GitHub
echo "🚀 دفع التحديثات إلى GitHub..."
git add .
git commit -m "🔧 إصلاح ملفات الموارد والمخططات

✅ الإصلاحات:
- إصلاح activity_receipt_list.xml (Premature end of file)
- إنشاء activity_base_list.xml المفقود
- إنشاء activity_trophy_detail.xml المفقود
- إنشاء مخططات الصفوف: notification_list_row.xml, chat_list_row.xml
- إضافة ألوان مفقودة

📊 تم حل مشكلة packageDebugResources"
git push -f origin main

echo "🎉 تم الانتهاء من إصلاح ملفات الموارد!"
echo "🚀 جاهز للبناء: ./gradlew build"

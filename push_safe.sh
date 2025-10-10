#!/bin/bash

echo "🚀 الدفع الآمن إلى GitHub..."

# عرض التغييرات أولاً قبل الدفع
echo "📋 التغييرات التي سيتم دفعها:"
git status

echo ""
echo "❓ هل تريد متابعة الدفع؟ (y/n)"
read -r response

if [ "$response" = "y" ] || [ "$response" = "Y" ]; then
    git add .
    git commit -m "🎨 إضافة الألوان المفقودة بشكل آمن
    
    ✅ تم إضافة الألوان التي كانت تسبب أخطاء البناء:
    - purple_500, purple_700
    - teal_200, teal_700  
    - black, white
    
    🔒 تم الحفاظ على جميع الموارد الموجودة مسبقاً"
    
    # محاولة الدفع إلى الفرع الحالي
    CURRENT_BRANCH=$(git branch --show-current)
    echo "📤 الدفع إلى فرع: $CURRENT_BRANCH"
    git push origin $CURRENT_BRANCH
else
    echo "❌ تم إلغاء الدفع"
fi

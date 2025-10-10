#!/bin/bash
echo "🔍 فحص أخطاء Java..."
./gradlew compileDebugJavaWithJavac --no-daemon --console=plain

echo "🔍 فحص أخطاء الـ Manifest..."
./gradlew processDebugManifest --no-daemon --console=plain

echo "🔍 فحص أخطاء الـ Resources..."
./gradlew processDebugResources --no-daemon --console=plain --stacktrace

echo "✅ انتهى الفحص"

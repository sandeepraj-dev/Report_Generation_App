# report_generation_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

📌 Flutter Setup
Check Flutter Installation
flutter doctor

📌 Create Android-Only Project
flutter create --platforms=android my_app
cd my_app

Disable all unused platforms:

flutter config --no-enable-web
flutter config --no-enable-windows-desktop
flutter config --no-enable-linux-desktop
flutter config --no-enable-macos-desktop

📌 Install Dependencies
flutter pub get

📌 Run App

List devices:

flutter devices

Run on Android:

flutter run

Run in release:

flutter run --release

📌 Build APK / AAB
Debug APK
flutter build apk --debug

Small Size Release APK
flutter build apk --release --split-per-abi

Play Store App Bundle (AAB)
flutter build appbundle

📌 Clean Project
flutter clean
flutter pub get

📌 Firebase Setup (Optional)

Install tools:

npm install -g firebase-tools
dart pub global activate flutterfire_cli

Configure:

flutterfire configure

📌 Useful Flutter Commands
Purpose Command
Check Flutter version flutter --version
Upgrade Flutter flutter upgrade
Analyze project flutter analyze
Format code dart format .
Add package flutter pub add <package>
Remove package flutter pub remove <package>
Check outdated packages flutter pub outdated
📌 Reduce APK Size

Edit android/app/build.gradle

minifyEnabled true
shrinkResources true

Build optimized APK:

flutter build apk --release --split-per-abi

📌 Folder Structure
lib/
├── main.dart
├── screens/
├── widgets/
├── models/
└── services/

📌 Keystore (Play Store)

Generate keystore:

keytool -genkey -v -keystore keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload

📌 Run on Specific Device
flutter run -d emulator-5554

📌 Fix Common Errors
Problem Fix
Build error flutter clean
Pub cache issue flutter pub cache repair
SDK mismatch flutter doctor
✅ Recommended Production Build
flutter clean
flutter pub get
flutter build apk --release --split-per-abi

---

1.

flutter pub add firebase_core
flutter pub add firebase_auth
flutter pub add cloud_firestore

2.  flutter pub get

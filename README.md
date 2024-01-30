# Elite Quiz App

```shell Get the packages
flutter pub get
```

## If Running the app for IoS, do this before

```shell
cd ios
pod install
cd ..
```

```shell Run the app
flutter run
```

```shell Build App Bundle
flutter build appbundle --release
open build/app/outputs/bundle/release/
```

```shell Build Apk
flutter build apk --split-per-abi
```

### Full project Clean up. Warning: after this you will have to start over the setup.

```shell
rm -rf .metadata \
.flutter-plugins-dependencies \
.flutter-plugins \
.idea \
.dart_tool \
build \
android/app/google-services.json \
android/.gradle \
ios/.symlinks \
ios/Pods \
ios/Runner/GoogleService-Info.plist \
ios/firebase_app_id_file.json \
ios/build \
ios/Podfile.lock \
pubspec.lock \
lib/firebase_options.dart
```
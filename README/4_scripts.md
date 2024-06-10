[<- Back](../README.md)

# Scripts
## Creare build.yaml
Build di tutti i moduli in automatico
```
targets:
  $default:
    builders:
      json_serializable|freezed|retrofit_generator:
        generate_for:
          - "{{}}.dart"
    sources:
      - "lib/**"
      - "test/**"
      - "data_module/**"
      - "domain_module/**"
```
## Da inserire in pubspec.yaml
```
# To run scripts follow this-> https://pub.dev/packages/rps
scripts:
  build: flutter pub run build_runner build --delete-conflicting-outputs
  watch: flutter pub run build_runner watch --delete-conflicting-outputs
  realm: dart run realm generate
  build_realm: flutter packages pub run build_runner build --delete-conflicting-outputs && dart run realm generate

  clean_build: flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
  clean_build_realm: flutter clean && flutter pub get && flutter packages pub run build_runner build --delete-conflicting-outputs && dart run realm generate

  flavorizr_install: flutter pub run flutter_flavorizr -p assets:download,assets:extract,android:androidManifest,android:buildGradle,android:dummyAssets,android:icons,ios:xcconfig,ios:buildTargets,ios:schema,ios:dummyAssets,ios:icons,ios:plist,ios:launchScreen,macos:xcconfig,macos:configs,macos:buildTargets,macos:schema,macos:dummyAssets,macos:icons,macos:plist,google:firebase,huawei:agconnect,assets:clean,ide:config

  apk:
    mock: flutter build apk --flavor mock -t lib/main_mock.dart --release
    dev: flutter build apk --flavor dev -t lib/main_dev.dart --release
    prod: flutter build apk --flavor prod -t lib/main_prod.dart --release
  ipa:
    mock: flutter build ios --flavor mock -t lib/main_mock.dart --release
    dev: flutter build ios --flavor dev -t lib/main_dev.dart --release
    prod: flutter build ios --flavor prod -t lib/main_prod.dart --release
```
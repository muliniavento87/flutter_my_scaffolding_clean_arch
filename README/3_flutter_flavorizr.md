[<- Back](../README.md)

# Generazione flavors
- Crea il file flavorizr.yaml nella root di progetto con le info dei flavors:
```
flavors:
  dev:
    app:
      name: "AppName Dev"

    android:
      applicationId: "com.example.primoprogetto.dev"
      firebase:
        config: ".firebase/dev/google-services.json"

    ios:
      bundleId: "com.example.primoprogetto.dev"
      firebase:
        config: ".firebase/dev/GoogleService-Info.plist"

  mock:
    app:
      name: "AppName Mock"

    android:
      applicationId: "com.example.primoprogetto.mock"
      firebase:
        config: ".firebase/mock/google-services.json"

    ios:
      bundleId: "com.example.primoprogetto.mock"
      firebase:
        config: ".firebase/mock/GoogleService-Info.plist"

  prod:
    app:
      name: "AppName"

    android:
      applicationId: "com.example.primoprogetto"
      firebase:
        config: ".firebase/prod/google-services.json"

    ios:
      bundleId: "com.example.primoprogetto"
      firebase:
        config: ".firebase/prod/GoogleService-Info.plist"
```
- Creiamo una cartella ".firebase" nella root di progetto con le cartelle sotto
  (con i relativi "google-services.json" e "GoogleService-Info.plist"):
    - dev
    - mock
    - prod
- Avvia lo script flavorizr_install, così verranno creati i flavors nei progetti nativi
```
flutter pub run flutter_flavorizr -p assets:download,assets:extract,android:androidManifest,android:buildGradle,android:dummyAssets,android:icons,ios:xcconfig,ios:buildTargets,ios:schema,ios:dummyAssets,ios:icons,ios:plist,ios:launchScreen,macos:xcconfig,macos:configs,macos:buildTargets,macos:schema,macos:dummyAssets,macos:icons,macos:plist,google:firebase,huawei:agconnect,assets:clean,ide:config
```
- esempio di avvio (flavor DEV)
```
flutter run --flavor=dev -t lib/main_dev.dart
```
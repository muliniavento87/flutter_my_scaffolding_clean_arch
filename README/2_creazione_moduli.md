[<- Back](../README.md)

# Creazione moduli
## Creazione
```
flutter create --template=module data_module && cd data_module && rm -r test .idea lib/main.dart *.iml; cd ..;
flutter create --template=module domain_module && cd domain_module && rm -r test .idea lib/main.dart *.iml; cd ..;
flutter create --template=module common_module && cd common_module && rm -r test .idea lib/main.dart *.iml; cd ..
```
## Add dipendenze base ai moduli
### data_module
riverpod (providers),
client rest (dio),
shared_preferences (local data)
```
cd data_module && flutter pub add flutter_riverpod dio awesome_dio_interceptor shared_preferences freezed_annotation; cd ..
```
### domain_module
riverpod (providers)
```
cd domain_module && flutter pub add flutter_riverpod json_annotation; cd ..
```
## Import moduli
### progetto ROOT (pubspec.yaml)
```
dependencies:
  flutter:
    sdk: flutter
  ...
  domain_module:
    path: ./domain_module
  data_module:
      path: ./data_module
  common_module:
      path: ./common_module
```
### data_module (pubspec.yaml)
```
dependencies:
  flutter:
    sdk: flutter
  ...
  domain_module:
    path: ../domain_module
  common_module:
    path: ../common_module
```
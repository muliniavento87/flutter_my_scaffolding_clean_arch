# flutter_my_scaffolding_clean_arch
Scheletro base di partenza per impostare una nuova app in Flutter con il paradigma della Clean Architecture:
1. crea il progetto flutter nuovo
2. crea i vari moduli
3. copia dentro cartelle e files
4. fixa dipendenze (nome package progetto diverso)

# Passaggi creazione struttura per nuovo progetto
1. Dipendenze base del progetto

**ATTENZIONE!**: Il progetto è settato in modo da avviare il build_runner su tutti i file del progetto e dei moduli.
Le dipendenze relative quindi basta metterle nel "pubspec.yaml" della root di progetto (es. "json_serializable").
```
# progetto [
    riverpod (providers),
    freezed (classi immutabili),
    go_router (routing pagine),
    flutter_flavorizr (gen. flavors),
    json_serializable (gen. modelli.g)
    build_runner (gen. codice)
  ]
flutter pub add flutter_riverpod freezed freezed_annotation json_serializable go_router flutter_flavorizr build_runner
```

2. Creazione moduli layers
- [README](README/2_creazione_moduli.md)

3. Creazione flavors
- [README](README/3_flutter_flavorizr.md)

4. Scripts (compilazione e builders)
- [README](README/4_scripts.md)

5. Scheletro common_module
- [README](README/5_scheletro_common_module.md)

6. Scheletro Domain Layer
- [README](README/6_scheletro_domain_layer.md)

7. Scheletro Data Layer
- [README](README/7_scheletro_data_layer.md)

8. Scheletro Presentation Layer
- [README](README/8_scheletro_presentation_layer.md)
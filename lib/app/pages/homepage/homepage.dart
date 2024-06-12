import 'package:data_module/di/di_repository.dart';
import 'package:domain_module/usecases/app_config/switch_theme_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'homepage_vm.dart';

class Homepage extends ConsumerWidget {
  static String pagePath = "/";

    Homepage({super.key});

    @override
    Widget build(BuildContext context, WidgetRef ref) {

        final isDarkModeProvider = ref.read(appConfigRepositoryProvider).isDarkModeProvider();
        final isDarkMode = ref.watch(isDarkModeProvider);

        final vm = ref.read(homepageProvider.notifier);
        //final state = ref.watch(homepageProvider);

        return Scaffold(
            appBar: AppBar(),
            body: Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Column(
                    children: [
                      const Text("Homepage"),
                      ElevatedButton(
                          onPressed: () {
                            //vm.switchTheme();
                            SwitchThemeUseCase(ref.read(appConfigRepositoryProvider)).call(ref);
                          },
                          child: const Text('Switch Theme')
                      ),
                    ],
                  ),
                )
            )
        );
    }
}
    
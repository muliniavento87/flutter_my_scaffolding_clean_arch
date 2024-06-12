import 'package:data_module/data_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'pages/homepage/homepage.dart';

///
void appMain({List<Override>? overrides}) async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer(overrides: overrides ?? []);

  container.read(appConfigRepositoryProvider).init()
      .then((value) {
    runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
  });
}

///
class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ref.watch(ref.read(appConfigRepositoryProvider).isDarkModeProvider()) ? F.theme.darkThemeData : F.theme.themeData,
      routerConfig: _router,
    );
  }
}

///
final _router = GoRouter(
  routes: [
    GoRoute(
      path: Homepage.pagePath,
      builder: (context, state) => Homepage(),
    ),
  ],
);
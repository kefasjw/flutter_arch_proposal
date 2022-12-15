import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/core/navigation/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(AppRouter.provider).router,
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
    );
  }
}

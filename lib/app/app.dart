import 'package:core/core.dart';
import 'package:core/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/app/navigation/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      builder: (context, child) {
        return CommonScreen(child: child ?? const SizedBox.shrink());
      },
      routerConfig: ref.watch(AppRouter.provider).router,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [AppLocalizations.delegate],
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

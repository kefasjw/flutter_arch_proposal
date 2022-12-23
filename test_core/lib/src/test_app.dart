import 'package:core/core.dart';
import 'package:core/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    super.key,
    this.overrides = const [],
    required this.child,
  });

  final List<Override> overrides;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        AppConfig.provider
            .overrideWithValue(const AppConfig(apiScheme: '', apiHost: '')),
        ...overrides,
      ],
      child: MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [AppLocalizations.delegate],
        home: child,
      ),
    );
  }
}

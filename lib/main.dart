import 'package:core/core.dart';
import 'package:core/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/app/app.dart';

void main() {
  const config = AppConfig(
    apiScheme: 'https',
    apiHost: 'private-8048f-kefasjw.apiary-mock.com',
  );
  mainWithConfig(config);
}

void mainWithConfig(AppConfig config) {
  runApp(
    ProviderScope(
      overrides: [
        AppConfig.provider.overrideWithValue(config),
      ],
      child: const App(),
    ),
  );
}

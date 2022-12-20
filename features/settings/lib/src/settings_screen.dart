import 'package:core/core.dart';
import 'package:core/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:settings/src/settings_controller.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(context.localizations.settings)),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                ref
                    .read(SettingsController.provider.notifier)
                    .onLogoutButtonPressed();
              },
              child: Text(context.localizations.logout),
            ),
          ],
        ),
      ),
    );
  }
}

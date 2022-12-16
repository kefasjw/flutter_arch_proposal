import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/feature/settings/settings_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                ref
                    .read(SettingsViewModel.provider.notifier)
                    .onLogoutButtonPressed();
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

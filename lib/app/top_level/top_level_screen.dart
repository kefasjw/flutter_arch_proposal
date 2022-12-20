import 'package:agent/agent.dart';
import 'package:core/core.dart';
import 'package:counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/app/navigation/router.dart';
import 'package:settings/settings.dart';

enum TopLevelTab {
  agents(
    route: AppRouter.agentsRoute,
    icon: Icons.people,
  ),
  counter(
    route: AppRouter.counterRoute,
    icon: Icons.calculate,
  ),
  settings(
    route: AppRouter.settingsRoute,
    icon: Icons.settings,
  );

  const TopLevelTab({
    required this.route,
    required this.icon,
  });

  final String route;

  final IconData icon;

  UiText get label {
    switch (this) {
      case TopLevelTab.agents:
        return UiText.localized((localizations) => localizations.agents);
      case TopLevelTab.counter:
        return UiText.localized((localizations) => localizations.counter);
      case TopLevelTab.settings:
        return UiText.localized((localizations) => localizations.settings);
    }
  }
}

class TopLevelScreen extends StatelessWidget {
  const TopLevelScreen({
    super.key,
    required this.tab,
    required this.onTabChanged,
  });

  final TopLevelTab tab;

  final Function(TopLevelTab tab) onTabChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _TopLevelChildScreen(tab: tab),
      bottomNavigationBar: NavigationBar(
        selectedIndex: TopLevelTab.values.indexWhere((tab) {
          return tab == this.tab;
        }),
        onDestinationSelected: (value) {
          onTabChanged(TopLevelTab.values[value]);
        },
        destinations: [
          ...TopLevelTab.values.map((tab) {
            return NavigationDestination(
              icon: Icon(tab.icon),
              label: context.getString(tab.label),
            );
          }),
        ],
      ),
    );
  }
}

class _TopLevelChildScreen extends StatelessWidget {
  const _TopLevelChildScreen({required this.tab});

  final TopLevelTab tab;

  @override
  Widget build(BuildContext context) {
    return LazyIndexedStack(
      index: TopLevelTab.values.indexWhere((tab) => tab == this.tab),
      children: const [
        AgentListScreen(),
        CounterScreen(),
        SettingsScreen(),
      ],
    );
  }
}

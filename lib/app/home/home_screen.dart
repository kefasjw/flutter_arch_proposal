import 'package:agent/agent.dart';
import 'package:core/core.dart';
import 'package:counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/app/navigation/router.dart';
import 'package:settings/settings.dart';
import 'package:shared_dependency/go_router.dart';

enum HomeTab {
  agents(
    route: AppRouter.agentsRoute,
    icon: Icons.people,
    label: 'Agents',
  ),
  counter(
    route: AppRouter.counterRoute,
    icon: Icons.calculate,
    label: 'Counter',
  ),
  settings(
    route: AppRouter.settingsRoute,
    icon: Icons.settings,
    label: 'Settings',
  );

  const HomeTab({
    required this.route,
    required this.icon,
    required this.label,
  });

  final String route;

  final IconData icon;

  final String label;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.tab,
  });

  final HomeTab tab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeChildScreen(tab: tab),
      bottomNavigationBar: NavigationBar(
        selectedIndex: HomeTab.values.indexWhere((tab) {
          return GoRouterState.of(context).subloc ==
              context.namedLocation(tab.route);
        }),
        onDestinationSelected: (value) {
          context.goNamed(HomeTab.values[value].route);
        },
        destinations: [
          ...HomeTab.values.map((tab) {
            return NavigationDestination(
              icon: Icon(tab.icon),
              label: tab.label,
            );
          }),
        ],
      ),
    );
  }
}

class _HomeChildScreen extends StatelessWidget {
  const _HomeChildScreen({required this.tab});

  final HomeTab tab;

  @override
  Widget build(BuildContext context) {
    return LazyIndexedStack(
      index: HomeTab.values.indexWhere((tab) => tab == this.tab),
      children: const [
        AgentListScreen(),
        CounterScreen(),
        SettingsScreen(),
      ],
    );
  }
}

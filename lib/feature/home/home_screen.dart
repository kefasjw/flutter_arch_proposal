import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/core/navigation/router.dart';
import 'package:flutter_arch_proposal/core/ui/lazy_indexed_stack.dart';
import 'package:flutter_arch_proposal/feature/agent/list/agent_list_screen.dart';
import 'package:flutter_arch_proposal/feature/counter/counter_screen.dart';
import 'package:go_router/go_router.dart';

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
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
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

class HomeChildScreen extends StatelessWidget {
  const HomeChildScreen({
    super.key,
    required this.tab,
  });

  final HomeTab tab;

  @override
  Widget build(BuildContext context) {
    return LazyIndexedStack(
      index: HomeTab.values.indexWhere((tab) => tab == this.tab),
      children: const [
        AgentListScreen(),
        CounterScreen(),
      ],
    );
  }
}

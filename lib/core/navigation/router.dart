import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/feature/home/home_screen.dart';
import 'package:go_router/go_router.dart';

final _homePageKey = UniqueKey();

const agentsRoute = "agents";
const counterRoute = "counter";

final router = GoRouter(
  initialLocation: '/$agentsRoute',
  routes: [
    GoRoute(
      name: agentsRoute,
      path: '/$agentsRoute',
      pageBuilder: (context, state) {
        return _homePage(
          const HomeScreen(child: HomeChildScreen(tab: HomeTab.agents)),
        );
      },
    ),
    GoRoute(
      name: counterRoute,
      path: '/$counterRoute',
      pageBuilder: (context, state) {
        return _homePage(
          const HomeScreen(child: HomeChildScreen(tab: HomeTab.counter)),
        );
      },
    ),
  ],
);

Page<void> _homePage(Widget child) {
  return MaterialPage(key: _homePageKey, child: child);
}

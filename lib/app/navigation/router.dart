import 'dart:async';

import 'package:auth/auth.dart';
import 'package:auth_core/auth_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/app/home/home_screen.dart';
import 'package:shared_dependency/flutter_riverpod.dart';
import 'package:shared_dependency/go_router.dart';

class AppRouter {
  AppRouter(this._authRepository);

  static final provider =
      Provider((ref) => AppRouter(ref.watch(AuthRepository.provider)));

  static final _homePageKey = UniqueKey();

  static const loginRoute = 'login';
  static const agentsRoute = 'agents';
  static const counterRoute = 'counter';
  static const settingsRoute = 'settings';

  final AuthRepository _authRepository;

  late final router = GoRouter(
    initialLocation: '/$agentsRoute',
    refreshListenable: _StreamListenable(_authRepository.isLoggedInStream),
    redirect: (context, state) async {
      // Unable to use named location here https://github.com/flutter/flutter/issues/116855
      final isLoggedIn = await _authRepository.isLoggedIn();
      if (!isLoggedIn && state.subloc != '/$loginRoute') {
        return '/$loginRoute';
      }
      return null;
    },
    routes: [
      GoRoute(
        name: agentsRoute,
        path: '/$agentsRoute',
        pageBuilder: (context, state) {
          return _homePage(
            const HomeScreen(tab: HomeTab.agents),
          );
        },
      ),
      GoRoute(
        name: counterRoute,
        path: '/$counterRoute',
        pageBuilder: (context, state) {
          return _homePage(
            const HomeScreen(tab: HomeTab.counter),
          );
        },
      ),
      GoRoute(
        name: settingsRoute,
        path: '/$settingsRoute',
        pageBuilder: (context, state) {
          return _homePage(const HomeScreen(tab: HomeTab.settings));
        },
      ),
      GoRoute(
        name: loginRoute,
        path: '/$loginRoute',
        builder: (context, state) {
          return LoginScreen(nextRoute: context.namedLocation(agentsRoute));
        },
      ),
    ],
  );

  Page<void> _homePage(Widget child) {
    return MaterialPage(key: _homePageKey, child: child);
  }
}

class _StreamListenable extends ChangeNotifier {
  _StreamListenable(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

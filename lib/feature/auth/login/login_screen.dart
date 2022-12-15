import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/app/navigation/router.dart';
import 'package:flutter_arch_proposal/feature/auth/login/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(LoginViewModel.provider.notifier).onScreenLoaded();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      LoginViewModel.provider.select((state) => state.isLoggedIn),
      (previous, next) {
        if (next) context.goNamed(AppRouter.agentsRoute);
      },
    );
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final isLoading = ref.watch(
              LoginViewModel.provider.select((value) => value.isLoading),
            );
            if (isLoading) {
              return const CircularProgressIndicator();
            } else {
              return ElevatedButton(
                onPressed: () {
                  ref
                      .read(LoginViewModel.provider.notifier)
                      .onLoginButtonPressed();
                },
                child: const Text('Login'),
              );
            }
          },
        ),
      ),
    );
  }
}

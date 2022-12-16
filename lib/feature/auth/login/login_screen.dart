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
  late final _usernameController = TextEditingController();

  late final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(LoginViewModel.provider.notifier).onScreenLoaded();
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _usernameField(),
              const SizedBox(height: 24.0),
              _passwordField(),
              const SizedBox(height: 8.0),
              _checkboxRow(),
              const SizedBox(height: 8.0),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Consumer(
      builder: (context, ref, child) {
        ref.listen(
          LoginViewModel.provider.select((state) => state.username),
          (previous, next) {
            if (next != _usernameController.text) {
              _usernameController.text = next;
            }
          },
        );
        return TextField(
          controller: _usernameController,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: 'Username',
            border: const OutlineInputBorder(),
            errorText: ref.watch(
              LoginViewModel.provider.select((state) => state.usernameError),
            ),
          ),
          onChanged:
              ref.read(LoginViewModel.provider.notifier).onUsernameChanged,
        );
      },
    );
  }

  Widget _passwordField() {
    return Consumer(
      builder: (context, ref, child) {
        ref.listen(
          LoginViewModel.provider.select((state) => state.password),
          (previous, next) {
            if (next != _passwordController.text) {
              _passwordController.text = next;
            }
          },
        );
        return TextField(
          controller: _passwordController,
          obscureText: true,
          onSubmitted: (_) {
            ref.read(LoginViewModel.provider.notifier).onLoginButtonPressed();
          },
          decoration: InputDecoration(
            labelText: 'Password',
            border: const OutlineInputBorder(),
            errorText: ref.watch(
              LoginViewModel.provider.select((state) => state.passwordError),
            ),
          ),
          onChanged:
              ref.read(LoginViewModel.provider.notifier).onPasswordChanged,
        );
      },
    );
  }

  Widget _checkboxRow() {
    return Row(
      children: [
        Consumer(
          builder: (context, ref, child) {
            return Checkbox(
              value: ref.watch(
                LoginViewModel.provider
                    .select((state) => state.shouldSaveUsername),
              ),
              onChanged: (_) {
                ref
                    .read(LoginViewModel.provider.notifier)
                    .onShouldSaveUsernameToggled();
              },
            );
          },
        ),
        const Text('Remember username'),
      ],
    );
  }

  Widget _loginButton() {
    return Consumer(
      builder: (context, ref, child) {
        final isEnabled = ref.watch(
          LoginViewModel.provider.select((state) => state.isLoginButtonEnabled),
        );
        return ElevatedButton(
          onPressed: isEnabled
              ? () {
                  ref
                      .read(LoginViewModel.provider.notifier)
                      .onLoginButtonPressed();
                }
              : null,
          child: const Text('Login'),
        );
      },
    );
  }
}

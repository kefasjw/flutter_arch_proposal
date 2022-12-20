import 'package:auth/src/login/login_controller.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependency/flutter_riverpod.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    super.key,
    required this.onLoggedIn,
  });

  final VoidCallback onLoggedIn;

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
      ref.read(LoginController.provider.notifier).onScreenLoaded();
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
      LoginController.provider.select((state) => state.isLoggedIn),
      (previous, next) {
        if (next) widget.onLoggedIn();
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
          LoginController.provider.select((state) => state.username),
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
            labelText: context.localizations.username,
            border: const OutlineInputBorder(),
            errorText: ref.watch(
              LoginController.provider.select(
                (state) => context.getString(state.usernameError).nullIfEmpty(),
              ),
            ),
          ),
          onChanged:
              ref.read(LoginController.provider.notifier).onUsernameChanged,
        );
      },
    );
  }

  Widget _passwordField() {
    return Consumer(
      builder: (context, ref, child) {
        ref.listen(
          LoginController.provider.select((state) => state.password),
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
            ref.read(LoginController.provider.notifier).onLoginButtonPressed();
          },
          decoration: InputDecoration(
            labelText: context.localizations.password,
            border: const OutlineInputBorder(),
            errorText: ref.watch(
              LoginController.provider.select(
                (state) => context.getString(state.passwordError).nullIfEmpty(),
              ),
            ),
          ),
          onChanged:
              ref.read(LoginController.provider.notifier).onPasswordChanged,
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
                LoginController.provider
                    .select((state) => state.shouldSaveUsername),
              ),
              onChanged: (_) {
                ref
                    .read(LoginController.provider.notifier)
                    .onShouldSaveUsernameToggled();
              },
            );
          },
        ),
        Text(context.localizations.rememberUsername),
      ],
    );
  }

  Widget _loginButton() {
    return Consumer(
      builder: (context, ref, child) {
        final isEnabled = ref.watch(
          LoginController.provider
              .select((state) => state.isLoginButtonEnabled),
        );
        return ElevatedButton(
          onPressed: isEnabled
              ? () {
                  ref
                      .read(LoginController.provider.notifier)
                      .onLoginButtonPressed();
                }
              : null,
          child: const Text('Login'),
        );
      },
    );
  }
}

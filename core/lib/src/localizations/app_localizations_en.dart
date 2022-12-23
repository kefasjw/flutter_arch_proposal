import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get agents => 'Agents';

  @override
  String get counter => 'Counter';

  @override
  String get settings => 'Settings';

  @override
  String get login => 'Login';

  @override
  String get logout => 'Logout';

  @override
  String get username => 'Username';

  @override
  String get rememberUsername => 'Remember username?';

  @override
  String get password => 'Password';

  @override
  String get usernameMinCharacters => 'Username min 3 characters';

  @override
  String get passwordMustNotEmpty => 'Password must not be empty';

  @override
  String get pushedCounterInformation => 'You\'ve pushed the button this many times:';

  @override
  String get retry => 'Retry';

  @override
  String get timeoutMessage => 'Connection timeout';

  @override
  String get errorMessage => 'Oops, something bad happened';
}

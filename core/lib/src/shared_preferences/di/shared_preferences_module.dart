import 'package:shared_dependency/flutter_riverpod.dart';
import 'package:shared_dependency/shared_preferences.dart';

final sharedPreferencesProvider = FutureProvider(
  (_) => SharedPreferences.getInstance(),
);

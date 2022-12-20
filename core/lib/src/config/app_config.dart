import 'package:shared_dependency/flutter_riverpod.dart';

class AppConfig {
  const AppConfig({
    required this.apiScheme,
    required this.apiHost,
  });

  static final provider = Provider<AppConfig>(
    (ref) {
      throw UnimplementedError(
        'AppConfig is not provided in the main function',
      );
    },
  );

  final String apiScheme;

  final String apiHost;
}

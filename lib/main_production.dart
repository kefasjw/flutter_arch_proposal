import 'package:core/core.dart';
import 'package:flutter_arch_proposal/main.dart';

void main() {
  const config = AppConfig(
    apiScheme: 'https',
    apiHost: 'example.com',
  );
  mainWithConfig(config);
}

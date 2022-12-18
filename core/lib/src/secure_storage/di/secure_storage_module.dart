import 'package:shared_dependency/flutter_riverpod.dart';
import 'package:shared_dependency/flutter_secure_storage.dart';

final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

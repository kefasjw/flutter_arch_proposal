import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_dependency/flutter_riverpod.dart';

final secureStorageProvider = Provider((ref) => const FlutterSecureStorage());

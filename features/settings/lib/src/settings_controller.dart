import 'package:auth_data/auth_data.dart';
import 'package:core/core.dart';
import 'package:core/flutter_riverpod.dart';

class SettingsController extends StateNotifier<void> {
  SettingsController(
    this._authRepository,
    this._commonController,
  ) : super(null);

  static final provider = StateNotifierProvider.autoDispose(
    (ref) {
      return SettingsController(
        ref.watch(AuthRepository.provider),
        ref.watch(CommonController.provider.notifier),
      );
    },
  );

  final AuthRepository _authRepository;

  final CommonController _commonController;

  Future<void> onLogoutButtonPressed() async {
    _commonController.showLoading(isLoading: true);
    await _authRepository.logout();
    _commonController.showLoading(isLoading: false);
  }
}

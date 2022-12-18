import 'package:auth_core/auth_core.dart';
import 'package:core/core.dart';
import 'package:shared_dependency/flutter_riverpod.dart';

class SettingsViewModel extends StateNotifier<void> {
  SettingsViewModel(
    this._authRepository,
    this._commonViewModel,
  ) : super(null);

  static final provider = StateNotifierProvider.autoDispose(
    (ref) {
      return SettingsViewModel(
        ref.watch(AuthRepository.provider),
        ref.watch(CommonViewModel.provider.notifier),
      );
    },
  );

  final AuthRepository _authRepository;

  final CommonViewModel _commonViewModel;

  Future<void> onLogoutButtonPressed() async {
    _commonViewModel.showLoading(isLoading: true);
    await _authRepository.logout();
    _commonViewModel.showLoading(isLoading: false);
  }
}

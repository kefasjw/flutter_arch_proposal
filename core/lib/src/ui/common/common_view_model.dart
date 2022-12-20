import 'dart:async';

import 'package:core/src/localizations/ui_text.dart';
import 'package:core/src/ui/common/snackbar_message.dart';
import 'package:shared_dependency/flutter_riverpod.dart';
import 'package:shared_dependency/freezed_annotation.dart';

part 'common_view_model.freezed.dart';

class CommonViewModel extends StateNotifier<CommonScreenState> {
  CommonViewModel() : super(const CommonScreenState());

  static final provider =
      StateNotifierProvider.autoDispose<CommonViewModel, CommonScreenState>(
    (ref) {
      return CommonViewModel();
    },
  );

  void showLoading({required bool isLoading}) {
    state = state.copyWith(isLoading: isLoading);
  }

  void handleCommonError(Object error) {
    final UiText message;
    if (error is TimeoutException) {
      message =
          UiText.localized((localizations) => localizations.timeoutMessage);
    } else {
      message = UiText.localized((localizations) => localizations.errorMessage);
    }
    showSnackBar(SnackBarMessage(message: message));
  }

  void showSnackBar(SnackBarMessage message) {
    state = state.copyWith(snackBarMessage: message);
  }
}

@freezed
class CommonScreenState with _$CommonScreenState {
  const factory CommonScreenState({
    @Default(false) bool isLoading,
    SnackBarMessage? snackBarMessage,
  }) = _CommonScreenState;
}

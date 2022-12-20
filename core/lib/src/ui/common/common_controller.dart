import 'dart:async';

import 'package:core/src/localizations/ui_text.dart';
import 'package:core/src/ui/common/snackbar_message.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_controller.freezed.dart';

class CommonController extends StateNotifier<CommonScreenUiState> {
  CommonController() : super(const CommonScreenUiState());

  static final provider =
      StateNotifierProvider.autoDispose<CommonController, CommonScreenUiState>(
    (ref) {
      return CommonController();
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
class CommonScreenUiState with _$CommonScreenUiState {
  const factory CommonScreenUiState({
    @Default(false) bool isLoading,
    SnackBarMessage? snackBarMessage,
  }) = _CommonScreenUiState;
}

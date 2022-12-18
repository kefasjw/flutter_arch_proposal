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
}

@freezed
class CommonScreenState with _$CommonScreenState {
  const factory CommonScreenState({
    @Default(false) bool isLoading,
  }) = _CommonScreenState;
}

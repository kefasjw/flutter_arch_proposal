import 'package:core/src/localizations/ui_text.dart';
import 'package:core/src/ui/common/common_view_model.dart';
import 'package:core/src/ui/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:shared_dependency/flutter_riverpod.dart';

/// Handle common features like loading overlay, showing dialog,
/// showing snackbar
class CommonScreen extends ConsumerWidget {
  const CommonScreen({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      CommonViewModel.provider.select((state) => state.snackBarMessage),
      (previous, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.getString(next.message))),
          );
        }
      },
    );
    return LoadingOverlay(
      isLoading: ref.watch(
        CommonViewModel.provider.select((state) => state.isLoading),
      ),
      child: child,
    );
  }
}

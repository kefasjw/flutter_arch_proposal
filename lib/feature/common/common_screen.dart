import 'package:flutter/material.dart';
import 'package:flutter_arch_proposal/core/ui/loading_overlay.dart';
import 'package:flutter_arch_proposal/feature/common/common_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return LoadingOverlay(
      isLoading: ref.watch(
        CommonViewModel.provider.select((state) => state.isLoading),
      ),
      child: child,
    );
  }
}

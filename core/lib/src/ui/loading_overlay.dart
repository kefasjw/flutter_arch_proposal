import 'package:flutter/material.dart';

class LoadingOverlay extends StatefulWidget {
  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;

  final Widget child;

  @override
  State<LoadingOverlay> createState() => _LoadingOverlayState();
}

class _LoadingOverlayState extends State<LoadingOverlay> {
  final _childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final child = KeyedSubtree(key: _childKey, child: widget.child);
    if (widget.isLoading) {
      return Stack(
        children: [
          child,
          const ModalBarrier(
            color: Colors.black54,
          ),
          Dialog(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(width: 24.0),
                  Text('Loading...'),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return child;
    }
  }
}

import 'package:flutter/material.dart';

/// Lazily load children's state instead of initialize them immediately like
/// [IndexedStack]
class LazyIndexedStack extends StatefulWidget {
  const LazyIndexedStack({
    super.key,
    this.alignment = AlignmentDirectional.topStart,
    this.textDirection,
    this.sizing = StackFit.loose,
    this.index = 0,
    this.children = const [],
  });

  final AlignmentGeometry alignment;

  final TextDirection? textDirection;

  final StackFit sizing;

  final int index;

  final List<Widget> children;

  @override
  State<LazyIndexedStack> createState() => _LazyIndexedStackState();
}

class _LazyIndexedStackState extends State<LazyIndexedStack> {
  late List<Widget> _lazyChildren = _initLazyChildren();

  @override
  void didUpdateWidget(covariant LazyIndexedStack oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.children.length != widget.children.length) {
      _lazyChildren = _initLazyChildren();
    }
    _lazyChildren[widget.index] = widget.children[widget.index];
  }

  List<Widget> _initLazyChildren() {
    return List.generate(
      widget.children.length,
      (index) {
        return widget.index == index
            ? widget.children[index]
            : const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      alignment: widget.alignment,
      textDirection: widget.textDirection,
      sizing: widget.sizing,
      index: widget.index,
      children: _lazyChildren,
    );
  }
}

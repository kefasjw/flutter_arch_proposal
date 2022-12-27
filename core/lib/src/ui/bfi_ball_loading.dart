import 'package:flutter/material.dart';

const _ballCount = 3;
const _duration = Duration(milliseconds: 500);
const _delay = Duration(milliseconds: 250);
const _smallBallSize = 12.0;
const _bigBallSize = 20.0;

class BfiBallLoading extends StatefulWidget {
  const BfiBallLoading({super.key});

  @override
  State<BfiBallLoading> createState() => _BfiBallLoadingState();
}

class _BfiBallLoadingState extends State<BfiBallLoading>
    with TickerProviderStateMixin {
  late final _controllers = List.generate(_ballCount, (index) {
    return AnimationController(
      duration: _duration,
      vsync: this,
    );
  });

  late final _animations = _controllers.map(
    (controller) {
      return Tween(begin: 1.0, end: _bigBallSize / _smallBallSize)
          .animate(controller);
    },
  ).toList();

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  Future<void> _startAnimation() async {
    for (final controller in _controllers) {
      controller.repeat(reverse: true);
      await Future.delayed(_delay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...List.generate(_ballCount, (index) {
            return [
              _ball(index),
              if (index < _ballCount) const SizedBox(width: _smallBallSize)
            ];
          }).expand((element) => element)
        ],
      ),
    );
  }

  Widget _ball(int index) {
    return ScaleTransition(
      scale: _animations[index],
      child: Container(
        width: _smallBallSize,
        height: _smallBallSize,
        decoration: const ShapeDecoration(
          shape: StadiumBorder(),
          color: Colors.blue,
        ),
      ),
    );
  }
}

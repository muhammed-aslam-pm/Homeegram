import 'package:flutter/material.dart';

class AnimatedWrapper extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double translateY;

  const AnimatedWrapper({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.translateY = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: duration,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, translateY * (1 - value)),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

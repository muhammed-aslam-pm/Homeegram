import 'package:flutter/material.dart';

enum AnimationDirection { top, bottom }

class AnimatedWrapper extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double translateY;
  final AnimationDirection direction;

  const AnimatedWrapper({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.translateY = 200,
    this.direction =
        AnimationDirection.bottom, // Default animation from the bottom
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: duration,
      builder: (context, value, child) {
        // Determine offset based on the animation direction
        final offset = direction == AnimationDirection.bottom
            ? translateY * (1 - value)
            : -translateY * (1 - value); // Negative for top animation

        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, offset),
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

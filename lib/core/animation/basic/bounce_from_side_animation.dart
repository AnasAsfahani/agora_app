import 'package:flutter/material.dart';

class BounceFromSideAnimation extends StatefulWidget {
  const BounceFromSideAnimation({
    super.key,
    required this.child,
    required this.delay,
    required this.direction, // 'left' or 'right'
  });

  final Widget child;
  final double delay;
  final String direction;

  @override
  _BounceFromSideAnimationState createState() => _BounceFromSideAnimationState();
}

class _BounceFromSideAnimationState extends State<BounceFromSideAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: (1500 * widget.delay).round()),
      vsync: this,
    );

    final curve = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );

    // Bounce from left or right
    final beginOffset = widget.direction == 'left' ? -100.0 : 100.0;

    animation = Tween<double>(begin: beginOffset, end: 0.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(animation.value, 0),
      child: widget.child,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
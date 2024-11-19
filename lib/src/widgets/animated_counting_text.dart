import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnimatedCountingText extends StatefulWidget {
  const AnimatedCountingText({
    super.key,
    required this.begin,
    required this.end,
    this.duration = const Duration(milliseconds: 2000),
    this.style,
  });

  final double begin;
  final double end;
  final Duration duration;
  final TextStyle? style;

  @override
  State<AnimatedCountingText> createState() => _AnimatedCountingTextState();
}

class _AnimatedCountingTextState extends State<AnimatedCountingText>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatNumber(double number) {
    return NumberFormat.decimalPattern('en_US')
        .format(number.round())
        .replaceAll(',', ' ');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final value = formatNumber(_animation.value);
        return Text(
          value,
          style: widget.style,
        );
      },
    );
  }
}
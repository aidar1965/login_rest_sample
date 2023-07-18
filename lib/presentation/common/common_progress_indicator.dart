import 'package:flutter/material.dart';

import '../values/palette.dart';

class CommonProgressIndicator extends StatefulWidget {
  const CommonProgressIndicator({Key? key, this.color}) : super(key: key);

  static const size = 32.0;

  final Color? color;

  @override
  State<CommonProgressIndicator> createState() =>
      _CommonProgressIndicatorState();
}

class _CommonProgressIndicatorState extends State<CommonProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Color _color;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
      lowerBound: 0.0,
      upperBound: 1.0,
    )..repeat(
        min: 0.0,
        max: 1.0,
        period: const Duration(milliseconds: 2000),
      );
  }

  @override
  void didChangeDependencies() {
    _color = _determinateColor(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _determinateColor(BuildContext context) {
    if (widget.color != null) {
      return widget.color!;
    } else {
      return Palette.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: CommonProgressIndicator.size,
      child: Stack(
        children: [
          RotationTransition(
            turns: CurvedAnimation(
                parent: _controller, curve: const Cubic(0.42, 0.0, 0.58, 1.0)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 7, color: _color),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 7, color: _color),
                )
              ],
            ),
          ),
          RotationTransition(
            turns: CurvedAnimation(
                parent: _controller, curve: const Cubic(0.54, 0.0, 0.58, 1.0)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 6, color: _color),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 6, color: _color),
                )
              ],
            ),
          ),
          RotationTransition(
            turns: CurvedAnimation(
                parent: _controller, curve: const Cubic(0.66, 0.0, 0.58, 1.0)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 5, color: _color),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 5, color: _color),
                )
              ],
            ),
          ),
          RotationTransition(
            turns: CurvedAnimation(
                parent: _controller, curve: const Cubic(0.78, 0.0, 0.58, 1.0)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 4, color: _color),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 4, color: _color),
                )
              ],
            ),
          ),
          RotationTransition(
            turns: CurvedAnimation(
                parent: _controller, curve: const Cubic(0.90, 0.0, 0.58, 1.0)),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 3, color: _color),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: _CircleItem(size: 3, color: _color),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleItem extends StatelessWidget {
  const _CircleItem({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: DecoratedBox(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

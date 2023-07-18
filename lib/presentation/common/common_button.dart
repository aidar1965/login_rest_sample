import 'package:flutter/material.dart';
import 'package:login_rest_sample/presentation/theme/context_extension.dart';

import '../values/palette.dart';
import '../values/values.dart';
import 'common_progress_indicator.dart';

class CommonAccentButton extends StatefulWidget {
  const CommonAccentButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isExpanded = false,
    this.isPending = false,
  });

  final Function()? onPressed;
  final String text;

  final bool isExpanded;
  final bool isPending;

  @override
  State<CommonAccentButton> createState() => _CommonAccentButtonState();
}

class _CommonAccentButtonState extends State<CommonAccentButton> {
  final color = Palette.accent;
  final textColor = Palette.white;
  final splashColor = Color.fromARGB(255, 95, 76, 219);

  @override
  Widget build(BuildContext context) {
    if (widget.isExpanded == false) {
      return FittedBox(
        child: _ButtonContent(
          onPressed: widget.onPressed,
          text: widget.text,
          isPending: widget.isPending,
          color: color,
          height: Values.buttonHeight,
          textColor: textColor,
          splashColor: splashColor,
        ),
      );
    } else {
      return _ButtonContent(
        onPressed: widget.onPressed,
        text: widget.text,
        color: color,
        isPending: widget.isPending,
        height: Values.buttonHeight,
        textColor: textColor,
        splashColor: splashColor,
      );
    }
  }
}

class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    Key? key,
    this.onPressed,
    required this.text,
    required this.isPending,
    this.color,
    this.gradient,
    required this.height,
    required this.textColor,
    this.splashColor,
    this.isDisabled = false,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;
  final Color? color;

  final bool isPending;
  final LinearGradient? gradient;
  final double height;
  final Color textColor;
  final Color? splashColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: height),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(Values.buttonRadius),
                    gradient: gradient),
              )),
        ),
        TextButton(
          onPressed: isDisabled == false ? onPressed : null,
          style: ButtonStyle(
              // если понадобится убрать сплеш
              // splashFactory: NoSplash.splashFactory,
              // overlayColor: MaterialStateProperty.all(Colors.transparent),
              minimumSize: MaterialStatePropertyAll(Size(1, height)),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              side: const MaterialStatePropertyAll(BorderSide.none),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Values.buttonRadius))),
              overlayColor: isDisabled == false
                  ? MaterialStatePropertyAll(splashColor)
                  : null),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: isPending == false
                  ? Text(
                      text,
                      style: context.style16w700button
                          ?.copyWith(color: textColor, fontSize: 15),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 15,
                          height: 15,
                          child: CommonProgressIndicator(color: textColor),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          text,
                          style: context.style16w700button
                              ?.copyWith(color: textColor),
                        )
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }
}

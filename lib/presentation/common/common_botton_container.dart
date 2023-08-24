import 'package:flutter/material.dart';

import '../values/palette.dart';

class CommonBottomContainer extends StatelessWidget {
  const CommonBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 9,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            height: 5,
            width: 135,
            decoration: BoxDecoration(
                color: Palette.text, borderRadius: BorderRadius.circular(2.5)),
          ),
        ));
  }
}

import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:login_rest_sample/presentation/theme/context_extension.dart';

import '../../../generated/locale_keys.g.dart';

import '../values/palette.dart';
import '../values/values.dart';

class CommonEditField extends StatelessWidget {
  const CommonEditField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.initialText,
      this.textInputType,
      this.obscureText});

  final String hintText;
  final TextEditingController controller;
  final String initialText;
  final TextInputType? textInputType;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialText,
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: Values.horizontalPadding, vertical: 19),
          border: InputBorder.none,
          fillColor: Palette.white,
          filled: true),
    );
  }
}

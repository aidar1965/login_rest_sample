import 'package:flutter/material.dart';

import '../../presentation/values/palette.dart';

/// расширение для сокращенного доступа к стилям текста и цветам
extension ContextExtension on BuildContext {
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// H1 заголовки:
  ///
  /// fontSize: 20,
  ///
  /// fontWeight: FontWeight.w600,
  ///
  /// color: palette.text,
  ///
  /// decoration: TextDecoration.none
  TextStyle? get style20w600head => Theme.of(this).textTheme.headlineLarge;

  /// Подзаголовки:
  ///
  /// fontSize: 12,
  ///
  /// fontWeight: FontWeight.w400,
  ///
  /// color: palette.text,
  ///
  /// decoration: TextDecoration.none
  TextStyle? get style12w400subtitle => Theme.of(this).textTheme.titleSmall;

  /// Кнопки:
  ///
  /// fontSize: 15,
  ///
  /// fontWeight: FontWeight.w500,
  ///
  /// color: palette.text,
  ///
  /// decoration: TextDecoration.none
  TextStyle? get style16w700button =>
      Theme.of(this).textTheme.bodyLarge?.copyWith(
          fontSize: 16, fontWeight: FontWeight.w700, color: Palette.white);

  /// Основной текст:
  ///
  /// fontSize: 15,
  ///
  /// fontWeight: FontWeight.w400,
  ///
  /// color: palette.text,
  ///
  /// decoration: TextDecoration.none
  TextStyle? get style15w400body => Theme.of(this).textTheme.bodyMedium;

  /// Меню:
  ///
  /// fontSize: 8,
  ///
  /// fontWeight: FontWeight.w400,
  ///
  /// color: palette.text,
  ///
  /// decoration: TextDecoration.none
  TextStyle? get style8w400menu => Theme.of(this).textTheme.labelSmall;

  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Предоставляет динамическую палитру цветов
  Palette? get palette => Palette();
}

import 'package:flutter/material.dart';

extension ThemeDataExtension on ThemeData {
  Color? get labelSmallColor => textTheme.labelSmall?.color;
  Color? get bodyLargeColor => textTheme.bodyLarge?.color;
  Color? get bodyMediumColor => textTheme.bodyMedium?.color;
  Color? get bodySmallColor => textTheme.bodySmall?.color;
  Color? get whiteColor => textTheme.titleLarge?.color;
}

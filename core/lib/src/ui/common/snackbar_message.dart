import 'package:core/src/localizations/ui_text.dart';
import 'package:flutter/material.dart';

class SnackBarMessage {
  SnackBarMessage({
    required this.message,
    this.action,
  });

  final UiText message;

  final VoidCallback? action;
}

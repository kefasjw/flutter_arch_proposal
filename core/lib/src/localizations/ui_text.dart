import 'package:core/core.dart';
import 'package:core/src/localizations/app_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_dependency/freezed_annotation.dart';

part 'ui_text.freezed.dart';

@freezed
class UiText with _$UiText {
  const factory UiText.string(String value) = UiTextString;

  const factory UiText.localized(LocalizationsBuilder builder) =
      UiTextLocalizations;

  static const empty = UiText.string('');
}

typedef LocalizationsBuilder = String Function(AppLocalizations localizations);

extension BuildContextLocalizations on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);

  String getString(UiText text) {
    return text.when(
      string: (value) => value,
      localized: (builder) => builder(localizations),
    );
  }
}

extension NullString on String {
  String? nullIfEmpty() {
    if (isEmpty) {
      return null;
    } else {
      return this;
    }
  }
}

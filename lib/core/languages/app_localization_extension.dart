import 'package:flutter/material.dart';
import 'package:mini_ui_project/localization/l10n/app_localization.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get t => AppLocalizations.of(this)!;
}
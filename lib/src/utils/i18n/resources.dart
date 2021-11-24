// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:church_plugin/src/utils/i18n/strings/en_us.dart';
import 'package:church_plugin/src/utils/i18n/strings/pt_es.dart';
import 'package:flutter/widgets.dart';
import 'package:church_plugin/src/utils/i18n/strings/pt_br.dart';
import 'package:church_plugin/src/utils/i18n/strings/translations.dart';

class R {
  static Translations strings = PtBr();

  static void load({Locale? locale}) {
    switch (locale.toString()) {
      case 'en_US':
        strings = EnUs();
        break;
      case 'pt_BR':
        strings = PtBr();
        break;
      case 'pt_ES':
        strings = PtEs();
        break;
      default:
        strings = PtBr();
        break;
    }
  }
}

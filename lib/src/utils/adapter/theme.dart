import 'package:flutter/material.dart';

class ThemeAdapter {
  static dynamic getTheme(String? name, BuildContext context) {

  Map<String, dynamic> map = {
    "headline1": Theme.of(context).textTheme.headline1,
    "headline2": Theme.of(context).textTheme.headline2,
    "headline3": Theme.of(context).textTheme.headline3,
    "headline4": Theme.of(context).textTheme.headline4,
    "headline5": Theme.of(context).textTheme.headline5,
    "headline6": Theme.of(context).textTheme.headline6,
    "bodyText1": Theme.of(context).textTheme.bodyText1,
    "bodyText2": Theme.of(context).textTheme.bodyText2,
  };

    return map[name] ?? Theme.of(context).textTheme.headline1;
  }
}


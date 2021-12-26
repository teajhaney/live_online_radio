import 'package:flutter/material.dart';

import 'constant.dart';

ThemeData getTheme() {
  return ThemeData(
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 35,
        color: kDefaultColor,
        fontWeight: FontWeight.bold,
      ),
      headline2: TextStyle(fontSize: 20, color: kPrimaryColor),
      headline3: TextStyle(fontSize: 25, color: kDefaultColor),
    ),
  );
}

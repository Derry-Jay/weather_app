import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import '../utils/values.dart';

class Css {
  static final Css _singleton = Css._internal();

  factory Css() {
    return _singleton;
  }

  Css._internal();

  final cityStyle = 'Poppins'.getStyleFromFont(fontWeight: 600.fontWeight),
      defaultXLMStyle = 'Poppins'.getStyleFromFont(
          fontSize: measurements.xl, fontWeight: 500.fontWeight),
      defaultLMStyle = 'Poppins'.getStyleFromFont(
          fontSize: measurements.large, fontWeight: 500.fontWeight),
      defaultMMStyle = 'Poppins'.getStyleFromFont(
          fontSize: measurements.medium, fontWeight: 500.fontWeight),
      applePlaceHolderStyle = TextStyle(
          fontWeight: 400.fontWeight, color: CupertinoColors.placeholderText),
      theme = ThemeData(
          primarySwatch: shades.kBlue,
          inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: shades.kWhite,
              border: const OutlineInputBorder()));
}

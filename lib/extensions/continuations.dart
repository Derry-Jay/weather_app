import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StrUt on String? {
  NumberFormat get fromPattern => NumberFormat(this);

  NumberFormat get fromLocale => NumberFormat(null, this);

// Location getLocation(List<TimeZone> zones, List<int> transitionAt,
//         List<int> transitionZone) =>
//     Location(this?.trimmed ?? '', transitionAt, transitionZone, zones);
}

extension IntUt on Size? {
  Widget constrainChild({Widget? child}) =>
      SizedBox.fromSize(size: this, child: child);
}

extension DoubUt on double? {
  Widget squareConstrainChild({Widget? child}) =>
      SizedBox.square(dimension: this, child: child);
}

extension IntUt1 on int? {
  FontWeight get fontWeight {
    switch (this) {
      case 100:
        return FontWeight.w100;
      case 200:
        return FontWeight.w200;
      case 300:
        return FontWeight.w300;
      case 400:
        return FontWeight.w400;
      case 500:
        return FontWeight.w500;
      case 600:
        return FontWeight.w600;
      case 700:
        return FontWeight.w700;
      case 800:
        return FontWeight.w800;
      case 900:
        return FontWeight.w900;
      default:
        return FontWeight.normal;
    }
  }
}

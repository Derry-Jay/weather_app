import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/extensions.dart';
import '../utils/values.dart';

class Measurements {
  static final Measurements _singleton = Measurements._internal();

  factory Measurements() => _singleton;

  Measurements._internal();

  final nil = 0.sp,
      unit = 1.sp,
      nilHt = 0.h,
      nilWb = 0.w,
      unitHt = 1.h,
      unitWb = 1.w,
      toolbarHeight = kToolbarHeight.h,
      xs = gc?.getValue<String>('xs').toInt().sp ?? double.nan,
      xl = gc?.getValue<String>('xl').toInt().sp ?? double.nan,
      xs2 = gc?.getValue<String>('2xs').toInt().sp ?? double.nan,
      xs3 = gc?.getValue<String>('3xs').toInt().sp ?? double.nan,
      xs4 = gc?.getValue<String>('4xs').toInt().sp ?? double.nan,
      xl2 = gc?.getValue<String>('2xl').toInt().sp ?? double.nan,
      xl3 = gc?.getValue<String>('3xl').toInt().sp ?? double.nan,
      xl4 = gc?.getValue<String>('4xl').toInt().sp ?? double.nan,
      xl5 = gc?.getValue<String>('5xl').toInt().sp ?? double.nan,
      small = gc?.getValue<String>('small').toInt().sp ?? double.nan,
      large = gc?.getValue<String>('large').toInt().sp ?? double.nan,
      medium = gc?.getValue<String>('medium').toInt().sp ?? double.nan,
      normal = gc?.getValue<String>('normal').toInt().sp ?? double.nan,
      stretchTriggerOffset =
          (((gc?.getValue<String>('4xl').toInt().sp ?? double.nan) +
                      (gc?.getValue<String>('5xl').toInt().sp ?? double.nan)) *
                  2)
              .sp,
      defaultGradientIconSize = (((gc?.getValue<String>('4xl').toInt() ?? 0) +
                  (gc?.getValue<String>('3xl').toInt() ?? 0) +
                  (gc?.getValue<String>('3xs').toInt() ?? 0)) /
              2)
          .sp;
}

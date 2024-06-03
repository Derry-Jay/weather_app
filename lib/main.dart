import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '/utils/methods.dart';
import '../extensions/extensions.dart';
import 'app.dart';
import 'models/common/app_config.dart';
import 'models/common/custom_http.dart';
import 'utils/values.dart';

void main() async {
  try {
    wb = WidgetsFlutterBinding.ensureInitialized();
    gc = await 'config'.configFromAsset;
    HttpOverrides.global = CustomHttp();
    acf = AppConfig.fromJson(
        (((await 'pubspec.yaml'.loadFromAssets()).getFromYAML() as Object)
                    .getEncoded())
                .getDecoded() as Map<String, Object?>? ??
            <String, Object?>{});
    // initializeTimeZones();
    if (await Permission.locationWhenInUse.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
    }
    (wb?.buildOwner?.debugBuilding ?? true)
        ? doNothing()
        : runApp(const MyApp());
  } catch (e) {
    e.jot();
  }
}

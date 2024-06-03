import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:global_configs/global_configs.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../css/css.dart';
import '../css/measurements.dart';
import '../css/shades.dart';
import '../extensions/extensions.dart';
import '../models/common/app_config.dart';
import '../models/common/progress.dart';
import '../modules/common_module.dart';
import '../modules/weather_module.dart';
import 'enums.dart';
import 'methods.dart';
import 'my_geocoder.dart';
import 'my_geolocator.dart';
import 'my_local_authentication.dart';
import 'route_generator.dart';

int page = 0;

WidgetsBinding? wb;

GlobalConfigs? res;

bool hideText = true;

GlobalConfiguration? gc;

AppConfig acf = AppConfig();

DateTime? currentBackPressTime;

StreamSubscription<Progress>? ssc;

Map<String, dynamic> body = <String, dynamic>{};

const apiMode =
    kDebugMode ? APIMode.dev : (kProfileMode ? APIMode.test : APIMode.prod);

final css = Css(),
    st = Stopwatch(),
    shades = Shades(),
    gco = MyGeocoder(),
    gl = MyGeolocator(),
    nf = NumberFormat(),
    conn = Connectivity(),
    today = DateTime.now(),
    picker = ImagePicker(),
    fmd1 = DateFormat.MMMd(),
    dip = DeviceInfoPlugin(),
    la = MyLocalAuthentication(),
    thisMoment = TimeOfDay.now(),
    sc = TextEditingController(),
    isCupertino = isIOS || isMac,
    loc = TextEditingController(),
    measurements = Measurements(),
    phc = TextEditingController(),
    pwc = TextEditingController(),
    sdc = TextEditingController(),
    edc = TextEditingController(),
    rg = RouteGenerator(flag: true),
    isPortable = isAndroid || isIOS,
    polylinePoints = PolylinePoints(),
    title = gc?.getValue<String>('name') ?? '',
    sharedPrefs = SharedPreferences.getInstance(),
    minPwdLth = gc?.getValue<String>('minimum_password_length').toInt() ?? 8,
    maxPwdLth = gc?.getValue<String>('maximum_password_length').toInt() ?? 16,
    emptyPos = Position(
        speed: 0,
        heading: 0,
        latitude: 0,
        accuracy: 0,
        altitude: 0,
        longitude: 0,
        speedAccuracy: 0,
        headingAccuracy: 0,
        altitudeAccuracy: 0,
        timestamp: 1970.getDate()),
    minDesignSize = Size(
        gc?.getValue<String>('minimum_screen_width').toDouble() ?? double.nan,
        gc?.getValue<String>('minimum_screen_height').toDouble() ?? double.nan),
    providers = <SingleChildWidget>[
      ChangeNotifierProvider<CommonModule>(create: getCommonModule),
      ChangeNotifierProvider<WeatherModule>(create: getWeatherModule)
    ],
    isIOS = Platform.isIOS && defaultTargetPlatform == TargetPlatform.iOS,
    isMac = Platform.isMacOS && defaultTargetPlatform == TargetPlatform.macOS,
    isLinux = Platform.isLinux && defaultTargetPlatform == TargetPlatform.linux,
    isAndroid =
        Platform.isAndroid && defaultTargetPlatform == TargetPlatform.android,
    isWindows =
        Platform.isWindows && defaultTargetPlatform == TargetPlatform.windows,
    isFuchsia =
        Platform.isFuchsia && defaultTargetPlatform == TargetPlatform.fuchsia,
    isWeb = !(isAndroid || isCupertino || isWindows || isLinux || isFuchsia) &&
        kIsWeb,
    spaceExp = r'\s'.getRE(),
    pwdExp =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$'.getRE(),
    mailExp =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"
            .getRE();

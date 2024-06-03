import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather_app/extensions/extensions.dart';

import '../mixins/mixins.dart';
import '../models/weather/climate.dart';
import '../utils/keys.dart';
import '../utils/methods.dart';
import '../utils/values.dart';

class WeatherModule extends ChangeNotifier with API {
  static final WeatherModule _singleton = WeatherModule._internal();

  factory WeatherModule(BuildContext context) {
    _singleton._buildContext = context;
    return _singleton;
  }

  WeatherModule._internal();

  CameraPosition? cp;

  double cityFontSize = 0.0;

  late BuildContext _buildContext;

  bool flag = false, loading = false;

  GoogleMapController? mapController;

  IconData icon = Icons.error_outline;

  BoxDecoration dec = const BoxDecoration();

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  int desFlex = 0,
      cardFlex = 0,
      listFlex = 0,
      cityFlex = 0,
      minMaxFlex = 0,
      humWindFlex = 0,
      tempFeelsFlex = 0,
      conditionFlex = 0;

  BuildContext get context =>
      navKey.currentContext ??
      (wb?.buildOwner?.focusManager.rootScope.context ?? _buildContext);

  void rebuild() {
    notifyListeners();
  }

  void setCameraPosition(CameraPosition pos) {
    cp = pos;
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
    try {
      _controller.isCompleted ? doNothing() : _controller.complete(controller);
    } catch (e) {
      _controller.completeError(e);
    }
  }

  void setIcon(Climate cm) {
    if (cm.cc.conditions.lowerCased.contains('storm') ||
        cm.description.lowerCased.contains('storm')) {
      icon = Icons.storm;
    } else if (cm.description.lowerCased.contains('cloudy') ||
        cm.description.lowerCased.contains('cloudy') ||
        cm.cc.conditions.lowerCased.contains('overcast') ||
        cm.cc.conditions.lowerCased.contains('overcast')) {
      icon = Icons.wb_cloudy;
    } else if (cm.description.lowerCased.contains('clear') ||
        cm.description.lowerCased.contains('sunny') ||
        cm.cc.conditions.lowerCased.contains('sunny') ||
        cm.cc.conditions.lowerCased.contains('clear')) {
      icon = Icons.wb_sunny;
    } else {
      icon = Icons.air;
    }
    dec = BoxDecoration(
        image: cm.cc.icon.ipFromAsset().getDecorImage(fit: 'fill'.boxFit));
  }

  void setValuesAccToOrientation(Orientation ol) {
    switch (ol) {
      case Orientation.landscape:
        desFlex = 3;
        cityFlex = 2;
        cardFlex = 3;
        listFlex = 2;
        minMaxFlex = 1;
        humWindFlex = 1;
        conditionFlex = 2;
        tempFeelsFlex = 1;
        cityFontSize = measurements.xl;
        break;
      default:
        desFlex = 2;
        cityFlex = 1;
        cardFlex = 19;
        listFlex = 21;
        minMaxFlex = 4;
        humWindFlex = 2;
        conditionFlex = 1;
        tempFeelsFlex = 2;
        cityFontSize = measurements.xl2;
    }
  }

  void onMapMoveStopped() async {
    final pc = await cp?.target.places ?? <Placemark>[];
    for (Placemark p in pc) {
      p.name.jot();
      p.administrativeArea.jot();
      p.country.jot();
      p.isoCountryCode.jot();
      p.postalCode.jot();
      p.locality.jot();
      p.street.jot();
      p.subAdministrativeArea.jot();
      p.subLocality.jot();
      p.subThoroughfare.jot();
    }
  }

  Future<Climate> get climate async {
    return Climate.fromJson(await getDataFromServer<Map<String, Object?>>(
            "${gc?.getValue<String>('visual_crossing_api_url')}${loc.text.firstLetterCapitalized}?unitGroup=metric&key=${gc?.getValue<String>('visual_crossing_api_key')}&contentType=json") ??
        <String, Object?>{});
  }
}

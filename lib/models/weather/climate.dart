import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../extensions/extensions.dart';
import 'current_condition.dart';
import 'weather_day.dart';

class Climate {
  int queryCost = 0;
  List<WeatherDay> days = <WeatherDay>[];
  LatLng latLong = const LatLng(0.0, 0.0);
  CurrentCondition cc = CurrentCondition();
  String address = '', description = '', resolvedAddress = '';

  Climate();

  Climate.fromJson(Map<String, Object?> json) {
    try {
      address = json['address'].string;
      description = json['description'].string;
      queryCost = json['queryCost'].string.toInt();
      resolvedAddress = json['resolvedAddress'].string;
      latLong = LatLng(json['latitude'].string.toDouble(),
          json['longitude'].string.toDouble());
      days = List<Map<String, Object?>>.from((json['days'] as List?) ?? [])
          .map<WeatherDay>(WeatherDay.fromJson)
          .toSet()
          .toList();
      cc = CurrentCondition.fromJson(
          json['currentConditions'] as Map<String, Object?>? ??
              <String, Object?>{});
    } catch (e) {
      'Climate'.jot();
      e.jot();
      'Climate'.jot();
    }
  }
}

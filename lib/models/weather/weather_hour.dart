import 'package:flutter/material.dart';

import '../../extensions/extensions.dart';
import '../../utils/values.dart';

class WeatherHour {
  DateTime dateTimeEpoch = 1970.getDate();
  String icon = '', source = '', conditions = '';
  TimeOfDay dateTime = const TimeOfDay(hour: 0, minute: 0);
  List<String> stations = <String>[], precipType = <String>[];
  num dew = 0.0,
      temp = 0.0,
      snow = 0.0,
      precip = 0.0,
      windDir = 0.0,
      uvIndex = 0.0,
      pressure = 0.0,
      humidity = 0.0,
      windGust = 0.0,
      moonPhase = 0.0,
      feelsLike = 0.0,
      snowDepth = 0.0,
      windSpeed = 0.0,
      severeRisk = 0.0,
      precipProb = 0.0,
      cloudCover = 0.0,
      visibility = 0.0,
      solarEnergy = 0.0,
      solarRadiation = 0.0;

  WeatherHour();

  WeatherHour.fromJson(Map<String, Object?> json) {
    try {
      dateTime = json['datetime'].string.time;
      dateTimeEpoch =
          (json['datetimeEpoch'].string.toInt() * 1000).getDateFromMilli();
      temp = json['temp'].string.toNum();
      feelsLike = json['feelslike'].string.toNum();
      dew = json['dew'].string.toNum();
      humidity = json['humidity'].string.toNum();
      precip = json['precip'].string.toNum();
      precipProb = json['precipprob'].string.toNum();
      precipType = List<String>.from(json['preciptype'] as List? ?? []);
      snow = json['snow'].string.toNum();
      snowDepth = json['snowdepth'].string.toNum();
      windGust = json['windgust'].string.toNum();
      windSpeed = json['windspeed'].string.toNum();
      windDir = json['winddir'].string.toNum();
      pressure = json['pressure'].string.toNum();
      cloudCover = json['cloudcover'].string.toNum();
      visibility = json['visibility'].string.toNum();
      solarRadiation = json['solarradiation'].string.toNum();
      solarEnergy = json['solarenergy'].string.toNum();
      uvIndex = json['uvindex'].string.toNum();
      severeRisk = json['severerisk'].string.toNum();
      moonPhase = json['moonphase'].string.toNum();
      conditions = json['conditions'].string;
      icon = "${acf.assetImagePath}${json['icon']}.jpg";
      stations = List<String>.from(json['stations'] as List? ?? []);
      source = json['source'].string;
    } catch (e) {
      e.jot();
    }
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherHour && dateTime.equals(other.dateTime);
  }

  @override
  int get hashCode => dateTime.hashCode;
}

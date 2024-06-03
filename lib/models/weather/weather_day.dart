import '../../extensions/extensions.dart';
import '../../utils/values.dart';
import 'weather_hour.dart';

class WeatherDay {
  List<WeatherHour> hours = <WeatherHour>[];
  List<String> stations = <String>[], precipType = <String>[];
  String icon = '', source = '', conditions = '', description = '';
  DateTime sunSet = 1970.getDate(),
      sunRise = 1970.getDate(),
      dateTime = 1970.getDate(),
      sunSetEpoch = 1970.getDate(),
      sunRiseEpoch = 1970.getDate(),
      dateTimeEpoch = 1970.getDate();
  num dew = 0.0,
      temp = 0.0,
      snow = 0.0,
      precip = 0.0,
      maxTemp = 0.0,
      minTemp = 0.0,
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
      precipCover = 0.0,
      feelsLikeMax = 0.0,
      feelsLikeMin = 0.0,
      solarRadiation = 0.0;

  WeatherDay();

  WeatherDay.fromJson(Map<String, Object?> json) {
    try {
      dateTime = json['datetime'].string.dateTime;
      dateTimeEpoch =
          (json['datetimeEpoch'].string.toInt() * 1000).getDateFromMilli();
      maxTemp = json['tempmax'].string.toNum();
      minTemp = json['tempmin'].string.toNum();
      temp = json['temp'].string.toNum();
      feelsLikeMax = json['feelslikemax'].string.toNum();
      feelsLikeMin = json['feelslikemin'].string.toNum();
      feelsLike = json['feelslike'].string.toNum();
      dew = json['dew'].string.toNum();
      humidity = json['humidity'].string.toNum();
      precip = json['precip'].string.toNum();
      precipProb = json['precipprob'].string.toNum();
      precipCover = json['precipcover'].string.toNum();
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
      sunRise = json['sunrise'].string.dateTime;
      sunRiseEpoch =
          (json['sunriseEpoch'].string.toInt() * 1000).getDateFromMilli();
      sunSet = json['sunset'].string.dateTime;
      sunSetEpoch =
          (json['sunsetEpoch'].string.toInt() * 1000).getDateFromMilli();
      moonPhase = json['moonphase'].string.toNum();
      conditions = json['conditions'].string;
      description = json['description'].string;
      icon = "${acf.assetImagePath}${json['icon']}.jpg";
      stations = List<String>.from(json['stations'] as List? ?? []);
      source = json['source'].string;
      hours = List<Map<String, Object?>>.from(json['hours'] as List? ?? [])
          .map<WeatherHour>(WeatherHour.fromJson)
          .toSet()
          .toList();
    } catch (e) {
      'Weather Day'.jot();
      e.jot();
      'Weather Day'.jot();
    }
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherDay && dateTime.compareDateOnly(other.dateTime);
  }

  @override
  int get hashCode => dateTime.hashCode;
}

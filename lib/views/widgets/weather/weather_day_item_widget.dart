import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../models/weather/weather_day.dart';
import '../../../models/weather/weather_hour.dart';
import '../../../utils/values.dart';

class WeatherDayItemWidget extends StatelessWidget {
  final int idx;
  final WeatherDay wd;

  const WeatherDayItemWidget({super.key, required this.wd, required this.idx});

  @override
  Widget build(BuildContext context) {
    final wm = context.getWeatherProvider();
    Widget getHourlyWeatherWidget(WeatherHour wh) {
      wm.setFeelsLikeText(wh);
      return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            EdgeInsets.only(top: context.height / 100).paddedWidget(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  wh.dateTime.time.textWidget(style: css.defaultXLMStyle),
                  wh.conditions.textWidget(style: css.defaultXLMStyle)
                ])),
            EdgeInsets.symmetric(vertical: context.height / 100).paddedWidget(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  'Temperature: ${wh.temp}°C'
                      .textWidget(style: css.defaultMMStyle),
                  '${wm.feelsLikeText} ${wh.feelsLike}°C'
                      .textWidget(style: css.defaultMMStyle)
                ])),
            EdgeInsets.only(bottom: context.height / 160).paddedWidget(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  'Humidity: ${wh.humidity}%'
                      .textWidget(style: css.defaultMMStyle),
                  'Wind: ${wh.windSpeed} Km/hr'
                      .textWidget(style: css.defaultMMStyle)
                ])),
            Container(
                color: shades.kBlack,
                height: measurements.unitHt,
                margin: EdgeInsets.symmetric(
                    horizontal: context.width / 100,
                    vertical: context.height / 160))
          ]);
    }

    return Card(
        elevation: 8,
        shadowColor: shades.kBlue,
        color: shades.kWhite.withOpacity(0.5),
        child: ExpansionTile(
            dense: true,
            onExpansionChanged: (bool flag) {
              wd.dateTimeEpoch.jot();
            },
            leading: wd.dateTime.string.dateWithF1.autoSizeTextWidget(
                style: css.defaultMMStyle,
                minFontSize: measurements.xs,
                maxFontSize: measurements.medium,
                stepGranularity: measurements.customStepGranularity),
            title: '${wd.temp.string}°C'.textWidget(style: css.defaultMMStyle),
            childrenPadding: EdgeInsets.symmetric(
                horizontal: context.width /
                    (wd.dateTimeEpoch.compareDateOnly(DateTime.now())
                        ? 50
                        : 100)),
            children: wd.hours.map<Widget>(getHourlyWeatherWidget).toList()));
  }
}

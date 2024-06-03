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
    Widget getHourlyWeatherWidget(WeatherHour wh) {
      final td = DateTime.now();
      String feelsLikeText;
      if (wh.dateTimeEpoch.hasPassed(td)) {
        feelsLikeText = 'Felt like';
      } else if (wh.dateTimeEpoch.isYetToPass(td)) {
        feelsLikeText = 'Will feel like';
      } else if (wh.dateTimeEpoch.compareDateOnly(td)) {
        feelsLikeText = 'Feels like';
      } else {
        feelsLikeText = '';
      }
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
            // 'Date: ${wh.dateTimeEpoch}'.textWidget(style: css.defaultLMStyle),
            EdgeInsets.symmetric(vertical: context.height / 100).paddedWidget(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  'Temperature: ${wh.temp}°C'
                      .textWidget(style: css.defaultMMStyle),
                  '$feelsLikeText ${wh.feelsLike}°C'
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
          leading: wd.dateTime.string.dateWithF1
              .textWidget(style: css.defaultMMStyle),
          title: '${wd.temp.string}°C'.textWidget(style: css.defaultMMStyle),
          childrenPadding: EdgeInsets.symmetric(
              horizontal: context.width /
                  (wd.dateTimeEpoch.compareDateOnly(DateTime.now())
                      ? 50
                      : 100)),
          children: wd.hours.map<Widget>(getHourlyWeatherWidget).toList(),
          // child: ListTile(
          //   leading: ,
          //   title: wd.conditions.textWidget(),
          // ),
          // Expanded(
          //     child: Column(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: <Widget>[
          //       Flexible(
          //           child: Row(
          //               mainAxisAlignment:
          //                   MainAxisAlignment.spaceBetween,
          //               children: [
          //             'Temperature: ${c.cc.temp}°C'.textWidget(
          //                 style: 'Poppins'.getStyleFromFont(
          //                     fontSize: measurements.large,
          //                     fontWeight: 500.fontWeight)),
          //             'Feels like ${c.cc.feelsLike}°C'.textWidget(
          //                 style: 'Poppins'.getStyleFromFont(
          //                     fontSize: measurements.large,
          //                     fontWeight: 500.fontWeight))
          //           ])),
          //       Flexible(
          //           child: Row(
          //               mainAxisAlignment:
          //                   MainAxisAlignment.spaceBetween,
          //               children: [
          //             'Maximum: ${dw.maxTemp}°C'.textWidget(
          //                 style: 'Poppins'.getStyleFromFont(
          //                     fontSize: measurements.large,
          //                     fontWeight: 500.fontWeight)),
          //             'Minimum: ${dw.minTemp}°C'.textWidget(
          //                 style: 'Poppins'.getStyleFromFont(
          //                     fontSize: measurements.large,
          //                     fontWeight: 500.fontWeight))
          //           ])),
          //       Flexible(
          //           child: Row(
          //               mainAxisAlignment:
          //                   MainAxisAlignment.spaceBetween,
          //               children: [
          //             'Humidity: ${c.cc.humidity}%'.textWidget(
          //                 style: 'Poppins'.getStyleFromFont(
          //                     fontSize: measurements.large,
          //                     fontWeight: 500.fontWeight)),
          //             'Wind: ${c.cc.windSpeed} Km/hr'.textWidget(
          //                 style: 'Poppins'.getStyleFromFont(
          //                     fontSize: measurements.large,
          //                     fontWeight: 500.fontWeight))
          //           ]))
          //     ])),
        ));
  }
}

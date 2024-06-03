import 'package:flutter/material.dart';

import '../../../extensions/continuations.dart';
import '../../../extensions/extensions.dart';
import '../../../models/weather/climate.dart';
import '../../../utils/enums.dart';
import '../../../utils/values.dart';
import '../common/circular_loader.dart';
import '../common/empty_widget.dart';
import 'weather_day_item_widget.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  Widget contentBuilder(BuildContext c1, AsyncSnapshot<Climate> ct) {
    try {
      switch (ct.connectionState) {
        case ConnectionState.done:
          if (ct.hasData && !ct.hasError) {
            final c = ct.data ?? Climate(),
                dw = c.days
                    .firstWhere((day) => day.dateTime.compareDateOnly(today));
            c1.getWeatherProvider().setIcon(c);
            Widget listBuilder(BuildContext c2, int i) {
              return WeatherDayItemWidget(wd: c.days[i], idx: i);
            }

            Widget layoutBuilder(BuildContext c3, Orientation layout) {
              final wm1 = c3.getWeatherProvider();
              wm1.setValuesAccToOrientation(layout);
              return Stack(children: <Widget>[
                Container(
                    width: c3.width, height: c3.height, decoration: wm1.dec),
                SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                        horizontal: c3.width / 20, vertical: c3.height / 80),
                    child: c3.nonNullSize.constrainChild(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Expanded(
                              flex: wm1.cardFlex,
                              child: Card(
                                  color: shades.kWhite.withOpacity(0.5),
                                  child: EdgeInsets.symmetric(
                                          horizontal: c3.width / 25.6)
                                      .paddedWidget(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                        Flexible(
                                            flex: wm1.cityFlex,
                                            child: 'City: ${c.address}'
                                                .textWidget(
                                                    style: css.cityStyle
                                                        .copyWith(
                                                            fontSize: wm1
                                                                .cityFontSize))),
                                        Flexible(
                                            flex: wm1.conditionFlex,
                                            child: c.cc.conditions.textWidget(
                                                style: css.defaultLMStyle)),
                                        Flexible(
                                            flex: wm1.desFlex,
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Flexible(
                                                      flex: 4,
                                                      child: c.description.readMore(
                                                          trimLength: 50,
                                                          style: css
                                                              .defaultMMStyle)),
                                                  Flexible(
                                                      child: wm1.icon
                                                          .iconBuilder())
                                                ])),
                                        Flexible(
                                            flex: wm1.tempFeelsFlex,
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      child: 'Temperature: ${c.cc.temp}°C'
                                                          .textWidget(
                                                              style: css
                                                                  .defaultLMStyle)),
                                                  Flexible(
                                                      child: 'Feels like ${c.cc.feelsLike}°C'
                                                          .textWidget(
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: css
                                                                  .defaultLMStyle))
                                                ])),
                                        Flexible(
                                            flex: wm1.minMaxFlex,
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      child: 'Maximum: ${dw.maxTemp}°C'
                                                          .textWidget(
                                                              style: css
                                                                  .defaultLMStyle)),
                                                  Flexible(
                                                      child: 'Minimum: ${dw.minTemp}°C'
                                                          .textWidget(
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: css
                                                                  .defaultLMStyle))
                                                ])),
                                        Flexible(
                                            flex: wm1.humWindFlex,
                                            child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      flex: 2,
                                                      child: 'Humidity: ${c.cc.humidity}%'
                                                          .textWidget(
                                                              style: css
                                                                  .defaultLMStyle)),
                                                  Flexible(
                                                      flex: 3,
                                                      child: 'Wind: ${c.cc.windSpeed} Kmph'
                                                          .textWidget(
                                                              textAlign:
                                                                  TextAlign
                                                                      .right,
                                                              style: css
                                                                  .defaultLMStyle)),
                                                ]))
                                      ])))),
                          Expanded(
                              flex: wm1.listFlex,
                              child: ListView.builder(
                                  // scrollDirection: Axis.horizontal,
                                  itemCount: c.days.length,
                                  itemBuilder: listBuilder))
                        ])))
              ]);
            }

            return OrientationBuilder(builder: layoutBuilder);
          } else if (!ct.hasData) {
            return 'No Data'.textWidget();
          } else if (ct.hasError) {
            final err = ct.error.string;
            'Snapshot'.jot();
            err.jot();
            'Snapshot'.jot();
            return Center(
                child: (err.contains('No element') ? 'No Data' : err)
                    .textWidget());
          } else {
            return const CircularLoader(
                loaderType: LoaderType.pouringHourGlass);
          }
        case ConnectionState.none:
          return const EmptyWidget();
        default:
          return const CircularLoader(loaderType: LoaderType.pouringHourGlass);
      }
    } catch (e) {
      'Weather Widget'.jot();
      e.jot();
      'Weather Widget'.jot();
      return Center(
          child: (e.string.contains('No element') ? 'No Data' : e.string)
              .textWidget());
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Climate>(
        future: context.getWeatherProvider().climate, builder: contentBuilder);
  }
}

import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/values.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/themed_app_bar.dart';
import '../../widgets/weather/weather_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Colors.transparent,
            appBar: ThemedAppBar(
                factor: 8,
                toolbarHeight: context.height / 8.192,
                title: CustomTextField(
                    controller: loc,
                    placeholder: 'Search Location',
                    material: InputDecoration(
                        hintText: 'Enter Location',
                        // helperText: 'Search Location',
                        suffix: Icons.search_sharp
                            .iconBuilder(color: shades.kBlue)
                            .iconButtonBuilder(
                                onPressed:
                                    context.getWeatherProvider().rebuild)))),
            body: const WeatherWidget()));
  }
}

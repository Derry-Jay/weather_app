import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../extensions/extensions.dart';
import '../../../utils/methods.dart';
import '../../../utils/values.dart';
import '../../widgets/common/circular_loader.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../widgets/common/empty_widget.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Widget mapBuilder(BuildContext context, AsyncSnapshot<Position> pos) {
    final wm = context.getWeatherProvider();
    try {
      switch (pos.connectionState) {
        case ConnectionState.done:
          if (pos.hasData && !pos.hasError) {
            final p = pos.data ?? emptyPos;
            wm.setCameraPosition(p.ll.getCameraPosition());
            return GoogleMap(
                compassEnabled: true,
                onMapCreated: wm.onMapCreated,
                onCameraIdle: wm.onMapMoveStopped,
                onCameraMove: wm.setCameraPosition,
                initialCameraPosition: p.ll.getCameraPosition());
          } else if (!pos.hasData) {
            return 'Cannot get Location'.textWidget();
          } else if (pos.hasError) {
            return pos.error.string.textWidget();
          } else {
            return const CircularLoader();
          }
        case ConnectionState.none:
          return const EmptyWidget();
        default:
          return const CircularLoader();
      }
    } catch (e) {
      e.jot();
      return e.string.textWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    final wm = context.getWeatherProvider();
    return Scaffold(
      // appBar: AppBar(
      //     ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          FutureBuilder<Position>(
              future: getCurrentLocation(), builder: mapBuilder),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomTextField(controller: loc),
              Icons.location_pin.iconBuilder(),
              wm.flag
                  ? 'No Weather Data'.textWidget()
                  : Card(
                      child: const Column(
                          // ,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[]))
            ],
          ),
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  void initState() {
    super.initState();
  }
}

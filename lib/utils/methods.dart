import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import '../extensions/extensions.dart';
import '../modules/common_module.dart';
import '../modules/weather_module.dart';
import '../views/widgets/common/empty_widget.dart';
import 'enums.dart';
import 'values.dart';

void rollbackOrientations() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void lockScreenRotation() async {
  await SystemChrome.setPreferredOrientations([
    // DeviceOrientation.landscapeRight,
    // DeviceOrientation.landscapeLeft,
    DeviceOrientation.portraitUp,
  ]);
}

void showStatusBar() async {
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
}

// void executeAccToOS(
//     {VoidCallback? android,
//     VoidCallback? fuchsia,
//     VoidCallback? ios,
//     VoidCallback? linux,
//     VoidCallback? mac,
//     VoidCallback? windows,
//     VoidCallback? web}) async {
//   switch (defaultTargetPlatform) {
//     case TargetPlatform.android:
//       final dro = await dip.androidInfo;
//       jot(dro.id);
//       jot(dro.board);
//       jot(dro.bootloader);
//       jot(dro.brand);
//       jot(dro.device);
//       jot(dro.display);
//       jot(dro.fingerprint);
//       jot(dro.hardware);
//       jot(dro.host);
//       jot(dro.id);
//       jot(dro.manufacturer);
//       jot(dro.version);
//       jot(dro.type);
//       jot(dro.tags);
//       jot(dro.systemFeatures);
//       jot(dro.supported64BitAbis);
//       jot(dro.supported32BitAbis);
//       jot(dro.model);
//       jot(dro.product);
//       android?.call();
//       break;
//     case TargetPlatform.fuchsia:
//       fuchsia?.call();
//       break;
//     case TargetPlatform.iOS:
//       final ini = await dip.iosInfo;
//       jot(ini.identifierForVendor);
//       jot(ini.model);
//       jot(ini.localizedModel);
//       jot(ini.name);
//       jot(ini.systemName);
//       jot(ini.systemVersion);
//       jot(ini.utsname.machine);
//       jot(ini.utsname.nodename);
//       jot(ini.utsname.release);
//       jot(ini.utsname.sysname);
//       jot(ini.utsname.version);
//       ios?.call();
//       break;
//     case TargetPlatform.linux:
//       final li = await dip.linuxInfo;
//       jot(li.id);
//       jot(li.name);
//       jot(li.buildId);
//       jot(li.idLike);
//       jot(li.machineId);
//       jot(li.prettyName);
//       jot(li.variant);
//       jot(li.variantId);
//       jot(li.version);
//       jot(li.versionCodename);
//       jot(li.versionId);
//       jot(li.data);
//       linux?.call();
//       break;
//     case TargetPlatform.macOS:
//       final cam = await dip.macOsInfo;
//       jot(cam.activeCPUs);
//       jot(cam.arch);
//       jot(cam.computerName);
//       jot(cam.cpuFrequency);
//       jot(cam.hostName);
//       jot(cam.kernelVersion);
//       jot(cam.memorySize);
//       jot(cam.model);
//       jot(cam.osRelease);
//       jot(cam.systemGUID);
//       jot(cam.data);
//       mac?.call();
//       break;
//     case TargetPlatform.windows:
//       final win = await dip.windowsInfo;
//       jot(win.computerName);
//       jot(win.buildLab);
//       jot(win.buildLabEx);
//       jot(win.buildNumber);
//       jot(win.csdVersion);
//       jot(win.deviceId);
//       jot(win.digitalProductId);
//       jot(win.displayVersion);
//       jot(win.editionId);
//       jot(win.installDate);
//       jot(win.majorVersion);
//       jot(win.minorVersion);
//       jot(win.numberOfCores);
//       jot(win.platformId);
//       jot(win.productId);
//       jot(win.productName);
//       jot(win.productType);
//       jot(win.registeredOwner);
//       jot(win.releaseId);
//       jot(win.reserved);
//       jot(win.servicePackMajor);
//       jot(win.servicePackMinor);
//       jot(win.suitMask);
//       jot(win.systemMemoryInMegabytes);
//       jot(win.userName);
//       jot(win.data);
//       windows?.call();
//       break;
//     default:
//       web?.call();
//       break;
//   }
// }

// void hideLoader(Duration time, {LoaderType? type}) {
//   Timer(time, () {
//     try {
//       overlayLoader(time, type: type).remove();
//     } catch (e) {
//       e.jot();
//     }
//   }).cancel();
// }

void doNothing() {}

// OverlayEntry overlayLoader(Duration time, {LoaderType? type}) {
//   Widget loaderBuilder(BuildContext context) {
//     return Positioned(
//         top: 0,
//         left: 0,
//         width: context.width,
//         height: context.height,
//         child: Material(
//             color: context.theme.primaryColor.withOpacity(0.5),
//             child: CircularLoader(
//                 duration: time,
//                 loaderType: type,
//                 // heightFactor: 16,
//                 // widthFactor: 16,
//                 color: context.theme.primaryColor)));
//   }

//   return OverlayEntry(builder: loaderBuilder);
// }

String emptyString() => '';

bool onBadCertificate(X509Certificate cert, String host, int port) {
  return true;
}

bool predicate(Route<dynamic> route) {
  route.jot();
  return false;
}

Icon obtainStar(int index) {
  return index.filledStar;
}

Icon obtainStarOutline(int index) {
  return index.outlinedStar;
}

CommonModule getCommonModule(BuildContext context) {
  return CommonModule(context);
}

WeatherModule getWeatherModule(BuildContext context) {
  return WeatherModule(context);
}

bool isFirstRoute(Route route) {
  route.jot();
  return route.isFirst;
}

bool isActiveRoute(Route route) {
  route.jot();
  return route.isActive;
}

bool isCurrentRoute(Route route) {
  route.jot();
  return route.isCurrent;
}

bool predicate4(Route route) {
  route.jot();
  return route.hasActiveRouteBelow;
}

bool predicate5(Route route) {
  route.jot();
  return route.willHandlePopInternally;
}

double getDoubleData(Map<String, dynamic> data) {
  return (data['data'] as double);
}

bool getBoolData(Map<String, dynamic> data) {
  return (data['data'] as bool);
}

String getData(List<int> values) {
  return base64.encode(values);
}

Uint8List fromIntList(List<int> list) {
  return getData(list).listData;
}

bool isImagePath(String str) {
  str.jot();
  return str.isImagePath;
}

String getCommonPattern(String s, String t) {
  List<List<int>> l =
      List.generate(s.length + 1, (_) => List.filled(t.length + 1, 0));
  int z = 0;
  List<String> ret = [];

  for (int i = 1; i <= s.length; i++) {
    for (int j = 1; j <= t.length; j++) {
      if (s[i - 1] == t[j - 1]) {
        if (i == 1 || j == 1) {
          l[i][j] = 1;
        } else {
          l[i][j] = l[i - 1][j - 1] + 1;
        }
        if (l[i][j] > z) {
          z = l[i][j];
          ret = [s.substring(i - z, i)];
        } else if (l[i][j] == z) {
          ret.add(s.substring(i - z, i));
        }
      } else {
        l[i][j] = 0;
      }
    }
  }
  return ret.singleOrNull ?? '';
}

Widget getAppleContextMenuBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return CupertinoAdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState);
}

Widget getContextMenuBuilder(
    BuildContext context, EditableTextState editableTextState) {
  return AdaptiveTextSelectionToolbar.editableText(
      editableTextState: editableTextState);
}

Widget getImageLoader(BuildContext context, Widget child, int? i, bool flag) {
  i.jot();
  flag.jot();
  return const EmptyWidget();
}

Widget getErrorWidget(BuildContext context, Object object, StackTrace? trace) {
  object.jot();
  trace.jot();
  return Text(object.string);
}

Future<Position> getCurrentLocation(
    {bool? falm, Duration? tl, LocationAccuracy? accuracy}) {
  return Geolocator.getCurrentPosition(
      timeLimit: tl,
      forceAndroidLocationManager: falm ?? false,
      desiredAccuracy: accuracy ?? LocationAccuracy.best);
}

Future<Uint8List> getBytesFromAsset(String path,
    {int? width, int? height}) async {
  final data = await rootBundle.load(path);
  final codec = await instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width, targetHeight: height);
  final fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

Future<XFile?> chooseMedium(
    {PickType? type,
    double? maxWidth,
    double? maxHeight,
    int? imageQuality,
    ImageSource? source,
    Duration? maxDuration,
    bool? requestFullMetadata,
    CameraDevice? preferredCameraDevice}) async {
  assert(type != null || type == PickType.media || source != null);
  try {
    switch (type) {
      case PickType.image:
        return picker.pickImage(
            source: source!,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: imageQuality,
            requestFullMetadata: requestFullMetadata ?? true,
            preferredCameraDevice: preferredCameraDevice ?? CameraDevice.rear);
      case PickType.media:
        return picker.pickMedia(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: imageQuality,
            requestFullMetadata: requestFullMetadata ?? true);
      case PickType.video:
        return picker.pickVideo(
            source: source!,
            maxDuration: maxDuration,
            preferredCameraDevice: preferredCameraDevice ?? CameraDevice.rear);
      default:
        return null;
    }
  } catch (e) {
    e.jot();
    return null;
  }
}

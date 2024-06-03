import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../utils/methods.dart';
import '../../extensions/extensions.dart';
import '../../utils/keys.dart';
import '../../utils/values.dart';
import '../models/common/progress.dart';

class CommonModule extends ChangeNotifier
    with AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin {
  static final CommonModule _singleton = CommonModule._internal();

  factory CommonModule(BuildContext context) {
    _singleton._buildContext = context;
    return _singleton;
  }

  CommonModule._internal();

  Animation<double>? animation;

  late BuildContext _buildContext;

  AnimationController? animationController;

  Stream<Progress> get progress => _progressCon.stream;

  final _progressCon = StreamController<Progress>.broadcast();

  BuildContext get context =>
      navKey.currentContext ??
      (wb?.buildOwner?.focusManager.rootScope.context ?? _buildContext);

  void addProgress(Progress p) {
    _progressCon.add(p);
  }

  void onProgressData(Progress event) {
    event.jot();
  }

  Future gotoNextScreen() async {
    return context.gotoForever('/weather');
  }

  void onProgress(int a, int b) async {
    ssc ??= progress.listen(onProgressData);
    'a: $a / b: $b'.jot();
    addProgress(Progress(a / b, '${((a * 100) / b).toStringAsFixed(2)}%'));
    if (a == b) {
      await ssc?.cancel();
      ssc = null;
    }
  }

  void nextScreen(Duration timeStamp) async {
    await Future.delayed(
        timeStamp.inSeconds == 3 ? timeStamp : const Duration(seconds: 3),
        gotoNextScreen);
  }

  void detectChange(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
      case AnimationStatus.dismissed:
        animationController?.dispose();
        break;
      default:
        doNothing();
        break;
    }
  }

  void goFrontIfMounted([double? from]) async {
    await animationController?.forward(from: from);
    animationController?.notifyListeners();
    animationController?.notifyStatusListeners(AnimationStatus.forward);
  }

  void rebuild() {
    notifyListeners();
  }

  void assignState(TickerProvider tp) {
    void setData(Duration duration) {
      animationController = AnimationController(duration: duration, vsync: tp);
      animation = Tween<double>(begin: context.pixelRatio, end: 0).animate(
          CurvedAnimation(parent: animationController!, curve: Curves.easeOut))
        ..addListener(rebuild)
        ..addListener(goFrontIfMounted)
        ..addStatusListener(detectChange);
    }

    wb?.addPostFrameCallback(setData);
  }

  void loaderDispose() {
    animationController?.dispose();
  }

  @override
  void didRegisterListener() {
    // TODO: implement didRegisterListener
    'object'.jot();
  }

  @override
  void didUnregisterListener() {
    // TODO: implement didUnregisterListener
    'object2'.jot();
  }
}

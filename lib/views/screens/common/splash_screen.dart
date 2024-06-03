import 'package:flutter/material.dart';

import '../../../../extensions/continuations.dart';
import '../../../../extensions/extensions.dart';
import '../../../../utils/enums.dart';
import '../../../utils/values.dart';
import '../../widgets/common/circular_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: context.nonNullSize.constrainChild(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
          Flexible(child: title.textWidget(style: css.appNameStyle)),
          const Flexible(
              child: CircularLoader(loaderType: LoaderType.waveSpinner)),
          Flexible(
              child: 'Version: ${acf.version}+${acf.buildNo}'
                  .textWidget(style: css.defaultMMStyle))
        ]))));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.getCommonProvider(false).nextScreen();
  }
}

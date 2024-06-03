import 'package:flutter/material.dart';

import '../../../../extensions/extensions.dart';
import '../../../../utils/enums.dart';
import '../../../../utils/values.dart';
import '../../widgets/common/circular_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wb?.addPostFrameCallback(context.getCommonProvider(false).nextScreen);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: const Text('My Weather App'),
                foregroundColor: Colors.white,
                backgroundColor: '#eb4034'.getColorFromHex()),
            body: const Center(
                child: CircularLoader(loaderType: LoaderType.waveSpinner))));
  }
}

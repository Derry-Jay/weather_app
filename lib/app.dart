import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '/extensions/extensions.dart';
import 'utils/keys.dart';
import 'utils/values.dart';
import 'views/screens/common/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget rootBuilder(BuildContext context, Widget? c2) {
    context.initScreenUtil(designSize: minDesignSize);
    return MaterialApp(
        home: c2,
        theme: css.theme,
        navigatorKey: navKey,
        onGenerateRoute: rg.generateRoute,
        debugShowCheckedModeBanner: kDebugMode);
  }

  Widget appBuilder(BuildContext context, Widget? c1) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: rootBuilder,
        designSize: minDesignSize,
        child: c1);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: providers, builder: appBuilder, child: const SplashScreen());
  }
}

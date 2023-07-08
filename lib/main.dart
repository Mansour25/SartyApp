import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sarty_app/myTest/myTest.dart';
import 'package:sarty_app/view/screens/account/create_account_screen.dart';

import 'view/screens/splash_screen/splash_screen.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFFFFF),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(478, 975),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xFFFFFFFF),
          ),
          debugShowCheckedModeBanner: false,
          home:  MyCustomSplashScreen(),
          // home: SplashScreen(),
        );
      },
    );
  }
}

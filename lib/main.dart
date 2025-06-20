import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:rentora_app/cores/databases/cache/cache_helper.dart';
import 'package:rentora_app/features/login_and_signup/views/login_screen.dart';




void main() {
    WidgetsFlutterBinding.ensureInitialized(); // مهم لتأجيل التشغيل
   CacheHelper().init(); // استدعاء دالة إعداد موفر الخدمة
  runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      ),
    );

}class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rentora',
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.light(),

      // darkTheme: ThemeData.dark(),

      //home: Homepage(),
      //home: PinCodeScreen('0414848'),
      home: LoginScreen(),
    );
  }
}

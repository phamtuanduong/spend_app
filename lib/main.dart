import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spend_app/screen/screen.dart';
import 'package:spend_app/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Comic Online',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: GalleryThemeData.lightThemeData.copyWith(),
      darkTheme: GalleryThemeData.darkThemeData.copyWith(),
      home: const HomeScreen(),
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

//Có thể nắm kéo danh sách
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

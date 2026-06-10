import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:investing101_development/core/routes/app_pages.dart';
import 'package:investing101_development/core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Investing101 Development',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      initialRoute: Routes.splash,
      getPages: appPages,
      debugShowCheckedModeBanner: false,
    );
  }
}

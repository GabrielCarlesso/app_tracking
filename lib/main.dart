import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:track_app/views/auth_verify.dart';
import 'package:track_app/shared/app_settings.dart';
//import 'package:track_app/views/screens/heat_map.dart';
import 'package:track_app/views/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettings.init(context);

    return GetMaterialApp(
      title: 'App Tracking',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.lightGreen),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.lightGreen,
        ),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

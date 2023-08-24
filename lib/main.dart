import 'package:app_tracking/pages/set_virtual_fence.dart';
import 'package:app_tracking/shared/property.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'auth/auth_verify.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterConfig.loadEnvVariables();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: VirtualFencePage(property: Property("Casa1")),
    );
  }
}

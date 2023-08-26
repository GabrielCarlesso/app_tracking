import 'package:app_tracking/pages/set_virtual_fence.dart';
import 'package:flutter/material.dart';
//import 'auth/auth_verify.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
  var count = 0.obs();
  count = count + 1;
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
      home: const VirtualFencePage(),
    );
  }
}

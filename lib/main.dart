//import 'package:app_tracking/pages/map_page.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
//import 'package:flutter_config/flutter_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //await FlutterConfig.loadEnvVariables();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginPage(),
    );
  }
}

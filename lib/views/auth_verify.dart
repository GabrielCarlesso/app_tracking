import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_app/controllers/auth_controller.dart';
import 'package:track_app/views/screens/home_page.dart';
import 'package:track_app/views/screens/login_page.dart';

class AuthVerify extends StatelessWidget {
  AuthVerify({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      switch (controller.state) {
        case AuthState.success:
          return const HomePage();
        case AuthState.idle || AuthState.error:
          return LoginPage();
        case AuthState.loading:
          return const CircularProgressIndicator();
      }
    });
  }
}

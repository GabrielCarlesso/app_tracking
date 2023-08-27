import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:track_app/controllers/auth_controller.dart';
import 'package:track_app/shared/app_colors.dart';
import 'package:track_app/shared/app_settings.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController _authController = Get.find();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: AppSettings.screenWidth,
        height: AppSettings.screenHeight,
        color: AppColors.whiteCuston,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            avatarLogo(),
            boxForms("User: nome@ufsm.br", TextInputType.emailAddress,
                Icons.dns_outlined, false, _userController),
            boxForms("Senha: ", TextInputType.number, Icons.view_list_outlined,
                true, _passwordController),
            loginButton(),
          ],
        ),
      ),
    );
  }

  Widget avatarLogo() {
    return const CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 70.0,
      child: Image(image: AssetImage("assets/images/login_photo.png")),
    );
  }

  Widget boxForms(String hintText, TextInputType textType, IconData icon,
      bool isObscure, TextEditingController textController) {
    isObscure = false;
    return Container(
      width: AppSettings.screenType == DeviceScreen.smartPhone
          ? AppSettings.screenWidth! * 0.8
          : 400,
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.black87, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      child: TextFormField(
        controller: textController,
        keyboardType: textType,
        obscureText: isObscure,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(icon, color: Colors.black87),
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.black38)),
      ),
    );
  }

  Widget loginButton() {
    return Container(
        padding: const EdgeInsets.only(top: 30),
        child: ElevatedButton.icon(
            onPressed: () {
              _authController.loginAction(
                  _userController.text, _passwordController.text);
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  const Color.fromARGB(240, 124, 187, 0), // foreground
              padding: const EdgeInsets.all(15),
              elevation: 2,
              textStyle: const TextStyle(fontSize: 20),
            ),
            icon: const Icon(Icons.input, size: 18),
            label: const Text("Login")));
  }
}

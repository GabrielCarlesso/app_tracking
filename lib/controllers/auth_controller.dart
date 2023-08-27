import 'package:dio/dio.dart';
import 'dart:developer';
import 'package:get/get.dart';

enum AuthState { idle, success, error, loading }

class AuthController extends GetxController {
  AuthState state = AuthState.idle;

  String baseUrl = 'http://localhost:8080/createToken';
  final dio = Dio();

  Future<void> loginAction(String user, String password) async {
    state = AuthState.loading;
    update();
    try {
      log("Response User: $user \nSenha: $password");
      state = AuthState.success;
      update();
    } catch (e) {
      log("Erro na requisição: $e");
      state = AuthState.error;
      update();
    }
  }

  void logout() {
    state = AuthState.idle;
    update();
  }
}

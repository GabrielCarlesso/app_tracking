// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'dart:developer';

enum AuthState { idle, success, error, loading }

class AuthController extends StateNotifier<AuthState> {
  AuthController() : super(AuthState.idle);

  String baseUrl = 'http://localhost:8080/createToken';
  final dio = Dio();
  String login = '';
  String password = '';

  Future<void> loginAction(String ip, String id) async {
    state = AuthState.loading;
    try {
      final response = await dio.get(
        baseUrl,
        queryParameters: {"id": id, "ip": ip},
      );
      log("Response Data: ${response.data}");
      state = AuthState.success;
    } catch (e) {
      log("Erro na requisição: $e");
      state = AuthState.error;
    }
  }

  void logout() {
    state = AuthState.idle;
  }
}

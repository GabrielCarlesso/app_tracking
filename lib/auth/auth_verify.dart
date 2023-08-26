/* 

// ignore_for_file: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../pages/login_page.dart';
import '../pages/map_page.dart';
import 'package:app_tracking/auth/auth_controller.dart';
import 'package:app_tracking/shared/providers.dart';

class AuthVerify extends ConsumerWidget {
  const AuthVerify({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    switch (authState) {
      case AuthState.success:
        return const MapPage();
      case AuthState.error:
        return const LoginPage();
      case AuthState.idle:
        return const LoginPage();
      case AuthState.loading:
        return const LoginPage();
    }
  }
}

*/
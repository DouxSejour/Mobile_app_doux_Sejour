import 'package:doux_sejour/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'core/di/service_locator.dart';

void main() {
  initDep();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

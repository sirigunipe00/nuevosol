import 'package:flutter/material.dart';
import 'package:nuevosol/styles/app_icons.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(child: Image.asset(AppIcons.logo.path)),
    );
  }
}
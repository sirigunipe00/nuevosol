import 'package:flutter/material.dart';
import 'package:nuevosol/widgets/loading_indicator.dart';

class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(child: LoadingIndicator())
      // enter(child: Image.asset('assets/dashboard_logo.png')),
    );
  }
}
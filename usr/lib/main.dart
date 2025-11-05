import 'package:couldai_user_app/app_theme.dart';
import 'package:couldai_user_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FinTrackAIApp());
}

class FinTrackAIApp extends StatelessWidget {
  const FinTrackAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinTrackAI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const DashboardScreen(),
    );
  }
}

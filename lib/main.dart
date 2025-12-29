import 'package:flutter/material.dart';
import 'core/routes/app_router.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(const SkincareApp());
}

class SkincareApp extends StatelessWidget {
  const SkincareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skincare App',
      theme: AppTheme.lightTheme,
      initialRoute: AppRouter.onboarding,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

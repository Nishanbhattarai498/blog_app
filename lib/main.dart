import 'package:flutter/material.dart';
import 'package:supabase_proj/core/theme/theme.dart';
import 'package:supabase_proj/features/auth/presentation/pages/login_page.dart';
import 'package:supabase_proj/features/auth/presentation/pages/signup_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: AppTheme.darkThemeMode,
      home: const LoginPage(),
    );
  }
}

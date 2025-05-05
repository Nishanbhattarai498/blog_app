import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_proj/core/secrets/app_secrets.dart';
import 'package:supabase_proj/core/theme/theme.dart';
import 'package:supabase_proj/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:supabase_proj/features/auth/data/reposetories/auth_reposetories_impl.dart';
import 'package:supabase_proj/features/auth/domain/usecases/user_singn_up.dart';
import 'package:supabase_proj/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:supabase_proj/features/auth/presentation/pages/login_page.dart';
import 'package:supabase_proj/features/auth/presentation/pages/signup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Supabase
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseurl,
    anonKey: AppSecrets.anonKey,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            userSingnUp: UserSingnUp(
              authRepository: AuthRepositoryImpl(
                authRemoteDataSource: AuthRemoteDataSourcesImpl(
                  supabaseClient: supabase.client,
                ),
              ),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
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

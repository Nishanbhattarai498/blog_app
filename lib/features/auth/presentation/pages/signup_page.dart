import 'package:flutter/material.dart';
import 'package:supabase_proj/core/theme/app_pallate.dart';
import 'package:supabase_proj/features/auth/presentation/widgets/auth_field.dart';
import 'package:supabase_proj/features/auth/presentation/widgets/auth_gradient_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign Up.',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              const AuthField(hintText: 'Name'),
              const SizedBox(height: 15),
              const AuthField(hintText: 'Email'),
              const SizedBox(height: 15),
              const AuthField(hintText: 'Password'),
              const SizedBox(height: 20),
              const AuthGradientButton(),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "Have an account?  ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: " Sign In",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

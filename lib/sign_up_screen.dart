import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_bloc.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_event.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Create account"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Email TF
            CupertinoTextField(
              placeholder: "Enter email",
              controller: _emailController,
              padding: const EdgeInsets.all(12),
              autocorrect: false,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            // Password TF
            CupertinoTextField(
              placeholder: "Enter password",
              controller: _passwordController,
              padding: const EdgeInsets.all(12),
              autocorrect: false,
              obscureText: true,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 8),
            // Confirm password TF
            CupertinoTextField(
              placeholder: "Confirm password",
              controller: _confirmPasswordController,
              padding: const EdgeInsets.all(12),
              autocorrect: false,
              obscureText: true,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const Spacer(),
            // SignUp button
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton.filled(
                onPressed: () {
                  context.read<AuthBloc>().add(
                        SignUpEvent(
                          email: _emailController.text,
                          password: _passwordController.text,
                          confirmPassword: _passwordController.text,
                        ),
                      );
                },
                child: const Text("Sign Up"),
              ),
            ),
            CupertinoButton(
              child: const Text("Already have an account? Sing in"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

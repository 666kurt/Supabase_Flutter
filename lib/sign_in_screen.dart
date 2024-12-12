import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter_auth/auth_service.dart';
import 'package:supabase_flutter_auth/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signIn() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      try {
        await _authService.signIn(email, password);
        _emailController.clear();
        _passwordController.clear();
      } catch (error) {
        throw Exception(error.toString());
      }
    } else {
      _emailController.clear();
      _passwordController.clear();
      throw Exception("TextField's is empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login"),
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
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton.filled(
                onPressed: signIn,
                child: const Text("Sign In"),
              ),
            ),
            CupertinoButton(
              child: const Text("Don't have an account? Sign up"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

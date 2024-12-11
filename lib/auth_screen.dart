import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter_auth/auth_service.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService _authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isSignInState = true;

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

  void signUp() async {
    final String email = _emailController.text;
    final String password = _passwordController.text;
    final String confirmPassword = _confirmPasswordController.text;

    if ((email.isNotEmpty && password.isNotEmpty) &&
        (password == confirmPassword)) {
      try {
        await _authService.signUp(email, password);
        _emailController.clear();
        _passwordController.clear();
        _confirmPasswordController.clear();
      } catch (error) {
        throw Exception(error.toString());
      }
    } else {
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      throw Exception("TextField's is empty");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(isSignInState ? "Login" : "Create account"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
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
            getConfirmTextField(),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton.filled(
                onPressed: isSignInState ? signIn : signUp,
                child: Text(isSignInState ? "Sign In" : "Sign up"),
              ),
            ),
            CupertinoButton(
              child: Text(isSignInState
                  ? "Don't have an account? Sign up"
                  : "Already have an account? Sing in"),
              onPressed: () {
                setState(() {
                  isSignInState = !isSignInState;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget getConfirmTextField() {
    if (!isSignInState) {
      return CupertinoTextField(
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
      );
    } else {
      return const SizedBox();
    }
  }
}

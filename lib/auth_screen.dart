import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Log In")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const CupertinoTextField(
              placeholder: "Enter email",
            ),
            const SizedBox(height: 8),
            const CupertinoTextField(
              placeholder: "Enter password",
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton.filled(
                onPressed: () {},
                child: const Text("Sign In"),
              ),
            ),
            CupertinoButton(
              child: Text("Don't have an account? Sign up"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

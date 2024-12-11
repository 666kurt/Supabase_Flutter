import 'package:flutter/material.dart';
import 'package:supabase_flutter_auth/auth_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final String? currentEmail = _authService.getCurrentEmail();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () async {
              await _authService.signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(child: Text(currentEmail ?? "No email")),
    );
  }
}

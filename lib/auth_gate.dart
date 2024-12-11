import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_auth/auth_screen.dart';

import 'home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final Session? session = snapshot.data?.session;
        if (session != null) {
          return HomeScreen();
        } else {
          return const AuthScreen();
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_bloc.dart';
import 'auth_gate.dart';

void main() async {
  await Supabase.initialize(
    url: "https://lrfnomppxjpqxgsdqkdt.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxyZm5vbXBweGpwcXhnc2Rxa2R0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM4MjkwODQsImV4cCI6MjA0OTQwNTA4NH0.ZdqOXQ5Hiw64pQ6re-C8tSM_paNIa23ElzVusXRFdhg",
  );
  runApp(const SupabaseFlutter());
}

class SupabaseFlutter extends StatelessWidget {
  const SupabaseFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthBloc(),
        child: const AuthGate(),
      ),
    );
  }
}

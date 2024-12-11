import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  // Instance of subase
  final SupabaseClient _supabaseInstance = Supabase.instance.client;

  // Sign in
  Future<AuthResponse> signIn(String email, String password) async {
    return await _supabaseInstance.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  // Sign up
  Future<AuthResponse> signUp(String email, String password) async {
    return await _supabaseInstance.auth.signUp(
      email: email,
      password: password,
    );
  }

  // Sign out
  Future<void> signOut() async {
    await _supabaseInstance.auth.signOut();
  }

  // Get current email
  String? getCurrentEmail() {
    final Session? session = _supabaseInstance.auth.currentSession;
    return session?.user.email;
  }
}

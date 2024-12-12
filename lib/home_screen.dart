import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_bloc.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_event.dart';
import 'package:supabase_flutter_auth/auth_bloc/auth_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(SignOutEvent());
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder<AuthBloc, BaseAuthState>(
        builder: (context, state) {
          if (state is AuthSignedInState) {
            return Center(child: Text(state.email));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

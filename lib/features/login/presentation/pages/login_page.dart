import 'package:doux_sejour/core/di/service_locator.dart';
import 'package:doux_sejour/features/login/presentation/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginBloc>(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              print(' state here: $state');
              return Column(
                children: [
                  TextField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(labelText: "Email"),
                  ),
                  TextField(
                    controller: passwordCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(height: 20),
                  if (state.loading) const CircularProgressIndicator(),
                  if (state.error != null)
                    Text(
                      state.error!.message,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().login(
                        emailCtrl.text.trim(),
                        passwordCtrl.text.trim(),
                      ).then((value) {
                        // Navigate to another page or show a success message
                        Navigator.pushReplacementNamed(context, '/home');
                      });
                    },
                    child: const Text("Login"),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

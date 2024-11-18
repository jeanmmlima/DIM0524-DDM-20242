import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Bem-vindo',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nome de usuário',
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Senha',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/catalog');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: const Text('Entrar'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
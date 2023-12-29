import 'package:flutter/material.dart';
import 'login_view_model.dart';
import 'styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final viewModel = LoginViewModel();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Forms and Button App')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: viewModel.emailController,
                decoration: inputDecoration('Електронна пошта'),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: viewModel.validateEmail,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: viewModel.passwordController,
                decoration: inputDecoration('Пароль'),
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: viewModel.validatePassword,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _showSnackBar("Подальші дії згідно логіки");
                    // Тут можна додати логіку логіну
                  }
                },
                child: const Text('Увійти'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

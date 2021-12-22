import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../login_store.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ModularState<LoginForm, LoginStore> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                ),
                keyboardType: TextInputType.emailAddress,
                onFieldSubmitted: controller.setEmailText,
                validator: controller.emailValidator,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Senha',
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                onFieldSubmitted: controller.setPasswordText,
                validator: controller.passwordValidator,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: const Text('ENTRAR'),
                onPressed: () {
                  final isValid = _formKey.currentState?.validate() ?? false;

                  if (!isValid) return;

                  controller.executeLogin();
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

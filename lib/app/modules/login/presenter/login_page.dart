import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_clean_architecture/app/modules/login/presenter/login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(color: Theme.of(context).primaryColor),
          SizedBox(
            height: 280,
            child: Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'E-mail',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onSubmitted: controller.setEmailText,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onSubmitted: controller.setPasswordText,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        child: const Text('ENTRAR'),
                        onPressed: controller.executeLogin,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

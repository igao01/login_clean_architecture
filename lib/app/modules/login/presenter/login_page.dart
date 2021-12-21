import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_clean_architecture/app/app_routes.dart';
import 'package:login_clean_architecture/app/core/errors/error_messages.dart';
import 'package:login_clean_architecture/app/core/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/presenter/login_store.dart';
import 'package:login_clean_architecture/app/modules/login/presenter/states/login_state.dart';
import 'package:login_clean_architecture/app/modules/login/presenter/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  Widget _buildError(Failure error) {
    if (error is ErrorLogin) {
      return Text(error.message);
    } else {
      return Text(Messages.unknowError);
    }
  }

  _openHomePage() {
    Modular.to.navigate(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) {
          var state = controller.state;

          if (state is ErrorState) {
            return _buildError(state.error);
          }

          if (state is LoadingState) {
            return const CircularProgressIndicator();
          }

          if (state is SuccessState) {
            _openHomePage();
          }

          return Stack(
            alignment: Alignment.center,
            children: [
              Container(color: Theme.of(context).primaryColor),
              const SizedBox(
                height: 280,
                child: LoginForm(),
              ),
            ],
          );
        },
      ),
    );
  }
}

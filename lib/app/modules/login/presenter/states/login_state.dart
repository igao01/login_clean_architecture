import 'package:login_clean_architecture/app/core/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/entities/user.dart';

abstract class LoginState {}

class StartState implements LoginState {
  const StartState();
}

class LoadingState implements LoginState {
  const LoadingState();
}

class ErrorState implements LoginState {
  final Failure error;
  const ErrorState(this.error);
}

class SuccessState implements LoginState {
  final User user;
  const SuccessState(this.user);
}

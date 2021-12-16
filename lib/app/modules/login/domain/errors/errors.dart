import 'package:login_clean_architecture/app/core/errors/errors.dart';

class ErrorLogin extends Failure {
  @override
  final String message;

  ErrorLogin(this.message);
}

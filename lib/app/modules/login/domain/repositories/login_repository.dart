import 'package:dartz/dartz.dart';
import 'package:login_clean_architecture/app/core/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/entities/user.dart';

abstract class LoginRepository {
  Future<Either<Failure, User>> executeLogin(String email, String password);
}

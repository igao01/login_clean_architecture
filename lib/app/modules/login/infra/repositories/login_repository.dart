import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_clean_architecture/app/core/errors/error_messages.dart';

import 'package:login_clean_architecture/app/core/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/entities/user.dart';
import 'package:login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:login_clean_architecture/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:login_clean_architecture/app/modules/login/infra/models/user_model.dart';

part 'login_repository.g.dart';

@Injectable(singleton: false)
class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, User>> executeLogin(
      String email, String password) async {
    UserModel user;

    try {
      user = await datasource.executeLogin(email, password);
    } catch (e) {
      return Left(ErrorLogin(Messages.loginFail));
    }
    return Right(user);
  }
}

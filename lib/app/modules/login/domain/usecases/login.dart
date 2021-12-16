import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_clean_architecture/app/core/connectivity/domain/connectivity_service.dart';
import 'package:login_clean_architecture/app/core/errors/error_messages.dart';
import 'package:login_clean_architecture/app/core/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/entities/user.dart';
import 'package:login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';

part 'login.g.dart';

abstract class Login {
  Future<Either<Failure, User>> call(String email, String password);
}

@Injectable()
class LoginImpl implements Login {
  final LoginRepository loginRepository;
  final ConnectivityService connectivityService;

  LoginImpl(this.loginRepository, this.connectivityService);

  @override
  Future<Either<Failure, User>> call(String email, String password) async {
    final isOffline = await connectivityService.isOffline();

    final emailIsNotValid = (!email.contains('@') || email.trim().length < 4);

    final passwordIsNotValid = (password.trim().length < 6);

    if (isOffline) {
      return Left(ErrorLogin(Messages.offlineMessage));
    } else if (emailIsNotValid) {
      return Left(ErrorLogin(Messages.invalidEmail));
    } else if (passwordIsNotValid) {
      return Left(ErrorLogin(Messages.invalidPassword));
    }

    return loginRepository.executeLogin(email, password);
  }
}

import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_clean_architecture/app/core/errors/error_messages.dart';
import 'package:login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:dio/dio.dart';
import 'package:login_clean_architecture/app/modules/login/infra/models/user_model.dart';

part 'login_datasource.g.dart';

@Injectable(singleton: false)
class LoginDatasourceImpl implements LoginDatasource {
  final Dio dio;

  LoginDatasourceImpl(this.dio);

  @override
  Future<UserModel> executeLogin(String email, String password) async {
    const url = '';
    final response = await dio.get(
      url,
      // este bloco será usado somente em uma requisicao real
      // queryParameters: {
      //   'email': email,
      //   'password': password,
      // },
    );
    if (response.statusCode == 200) {
      return UserModel(
        uid: response.data['uid'],
        email: response.data['email'],
        name: response.data['name'],
      );
    } else {
      throw ErrorLogin(Messages.loginFail);
    }
  }
}

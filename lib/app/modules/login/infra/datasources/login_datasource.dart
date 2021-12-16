import 'package:login_clean_architecture/app/modules/login/infra/models/user_model.dart';

abstract class LoginDatasource {
  Future<UserModel> executeLogin(String email, String password);
}

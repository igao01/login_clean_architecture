import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_clean_architecture/app/modules/login/domain/usecases/login.dart';
import 'package:login_clean_architecture/app/modules/login/presenter/states/login_state.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

@Injectable(singleton: false)
class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final Login login;

/*
  Esta dependência não está sendo reconhecida 
  na execução real do código,
  porem é reconhecida ao utilizar Mocks
  durante os testes
*/
  _LoginStoreBase(this.login);

  @observable
  LoginState state = const StartState();

  @observable
  String emailText = '';

  @observable
  String passwordText = '';

  @action
  setState(LoginState value) => state = value;

  @action
  setEmailText(String value) => emailText = value;

  @action
  setPasswordText(String value) => passwordText = value;

  @action
  Future<LoginState> executeLogin() async {
    setState(const LoadingState());
    final result = await login(emailText, passwordText);
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_clean_architecture/app/core/errors/error_messages.dart';
import 'package:login_clean_architecture/app/modules/login/domain/entities/user.dart';
import 'package:login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/usecases/login.dart';
import 'package:login_clean_architecture/app/modules/login/presenter/login_store.dart';
import 'package:login_clean_architecture/app/modules/login/presenter/states/login_state.dart';
import 'package:mocktail/mocktail.dart';

class LoginMock extends Mock implements Login {}

main() {
  final login = LoginMock();
  final LoginStore store;

  store = LoginStore(login);

  test('Must to return ErrorState', () async {
    when(() => login.call('', ''))
        .thenAnswer((_) async => Left(ErrorLogin('')));

    final result = await store.executeLogin();

    expect(result, isA<ErrorState>());
  });

  test('Must to return SuccesState', () async {
    const user = User(uid: "qwerty");

    when(() => login.call('', '')).thenAnswer((_) async => const Right(user));

    final result = await store.executeLogin();

    expect(result, isA<SuccessState>());
  });

  test('valid email', () {
    final result = store.emailValidator('email@valido');
    expect(result, null);
  });

  test('short email', () {
    final result = store.emailValidator('ab@');
    expect(result, Messages.invalidEmail);
  });

  test('email without @', () {
    final result = store.emailValidator('emailtest');
    expect(result, Messages.invalidEmail);
  });

  test('valid password', () {
    final result = store.passwordValidator('validpassword');
    expect(result, null);
  });

  test('short password', () {
    final result = store.passwordValidator('pass');
    expect(result, Messages.invalidPassword);
  });
}

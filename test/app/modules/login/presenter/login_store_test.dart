import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
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
    final user = User(uid: "qwerty");

    when(() => login.call('', '')).thenAnswer((_) async => Right(user));

    final result = await store.executeLogin();

    expect(result, isA<SuccessState>());
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_clean_architecture/app/modules/login/infra/datasources/login_datasource.dart';
import 'package:login_clean_architecture/app/modules/login/infra/models/user_model.dart';
import 'package:login_clean_architecture/app/modules/login/infra/repositories/login_repository.dart';
import 'package:mocktail/mocktail.dart';

class LoginDatasourceMock extends Mock implements LoginDatasource {}

main() {
  final datasource = LoginDatasourceMock();
  final repository = LoginRepositoryImpl(datasource);

  test("login success", () async {
    final user = UserModel(uid: 'qwerty');
    when(() => datasource.executeLogin('', '')).thenAnswer((_) async => user);

    final result = await repository.executeLogin('', '');

    expect(result, Right(user));
    expect(result.fold((l) => id, (r) => r.uid), 'qwerty');
  });
}

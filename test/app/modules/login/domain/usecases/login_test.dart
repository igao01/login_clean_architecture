import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_clean_architecture/app/core/connectivity/domain/connectivity_service.dart';
import 'package:login_clean_architecture/app/core/errors/error_messages.dart';
import 'package:login_clean_architecture/app/modules/login/domain/entities/user.dart';
import 'package:login_clean_architecture/app/modules/login/domain/errors/errors.dart';
import 'package:login_clean_architecture/app/modules/login/domain/repositories/login_repository.dart';
import 'package:login_clean_architecture/app/modules/login/domain/usecases/login.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements LoginRepository {}

class ConnectivityServiceMock extends Mock implements ConnectivityService {}

main() {
  final repository = LoginRepositoryMock();
  final connectivity = ConnectivityServiceMock();
  final usecase = LoginImpl(repository, connectivity);

  test("login success", () async {
    const user = User(uid: 'qwerty', email: 'joao@email.com');

    when(() => connectivity.isOffline()).thenAnswer((_) async => false);
    when(() => repository.executeLogin('joao@email.com', '123456'))
        .thenAnswer((_) async => const Right(user));

    final result = await usecase('joao@email.com', '123456');

    expect(result, const Right(user));
    expect(result.fold((l) => id, (r) => r.uid), 'qwerty');
    expect(result.fold((l) => id, (r) => r.email), 'joao@email.com');
  });

  test("connectivity fail", () async {
    when(() => connectivity.isOffline()).thenAnswer((_) async => true);

    final result = await usecase('joao@email.com', '123456');

    expect(result.leftMap((l) => l is ErrorLogin), const Left(true));
    expect(result.fold((l) => l.message, id), Messages.offlineMessage);
  });

  test("empty email", () async {
    when(() => connectivity.isOffline()).thenAnswer((_) async => false);

    final result = await usecase('', '123456');

    expect(result.leftMap((l) => l is ErrorLogin), const Left(true));
    expect(result.fold((l) => l.message, (r) => id), Messages.invalidEmail);
  });

  test("invalid email", () async {
    when(() => connectivity.isOffline()).thenAnswer((_) async => false);

    // email without @
    final result = await usecase('invalidemail.com', '123456');

    expect(result.leftMap((l) => l is ErrorLogin), const Left(true));
    expect(result.fold((l) => l.message, (r) => id), Messages.invalidEmail);
  });

  test("invalid password", () async {
    when(() => connectivity.isOffline()).thenAnswer((_) async => false);

    final result = await usecase('joao@email.com', '1234');

    expect(result.leftMap((l) => l is ErrorLogin), const Left(true));
    expect(result.fold((l) => l.message, (r) => id), Messages.invalidPassword);
  });
}

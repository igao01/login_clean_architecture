import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_clean_architecture/app/core/connectivity/domain/connectivity_service.dart';
import 'package:mocktail/mocktail.dart';

class ConnectivityMock extends Mock implements Connectivity {}

main() {
  final connectivity = ConnectivityMock();
  final connectivityImpl = ConnectivityServiceImpl(connectivity);

  test('offline user', () async {
    when(() => connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.none);
    final result = await connectivityImpl.isOffline();
    expect(result, true);
  });

  test('online by mobile', () async {
    when(() => connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.mobile);

    final result = await connectivityImpl.isOffline();
    expect(result, false);
  });

  test('online by wifi', () async {
    when(() => connectivity.checkConnectivity())
        .thenAnswer((_) async => ConnectivityResult.wifi);

    final result = await connectivityImpl.isOffline();
    expect(result, false);
  });
}

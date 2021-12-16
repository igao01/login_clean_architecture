import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_clean_architecture/app/modules/login/external/datasources/login_datasource.dart';
import 'package:login_clean_architecture/app/modules/login/infra/models/user_model.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = LoginDatasourceImpl(dio);

  test('UserModel success login request', () async {
    var response = '''{
        "data":{
          "uid": "asdfg",
          "name": "pedro",
          "email": "pedro@email.com",
          "password": "123456"
          }
        }''';

    when(() => dio.get('')).thenAnswer(
      (_) async => Response(
        data: jsonDecode(response),
        statusCode: 200,
        requestOptions: RequestOptions(path: ''),
      ),
    );
    final result = await datasource.executeLogin('', '');

    expect(result, isA<UserModel>());
  });
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginStore = BindInject(
  (i) => LoginStore(),
  isSingleton: false,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on LoginStoreBase, Store {
  final _$stateAtom = Atom(name: 'LoginStoreBase.state');

  @override
  LoginState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoginState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$emailTextAtom = Atom(name: 'LoginStoreBase.emailText');

  @override
  String get emailText {
    _$emailTextAtom.reportRead();
    return super.emailText;
  }

  @override
  set emailText(String value) {
    _$emailTextAtom.reportWrite(value, super.emailText, () {
      super.emailText = value;
    });
  }

  final _$passwordTextAtom = Atom(name: 'LoginStoreBase.passwordText');

  @override
  String get passwordText {
    _$passwordTextAtom.reportRead();
    return super.passwordText;
  }

  @override
  set passwordText(String value) {
    _$passwordTextAtom.reportWrite(value, super.passwordText, () {
      super.passwordText = value;
    });
  }

  final _$executeLoginAsyncAction = AsyncAction('LoginStoreBase.executeLogin');

  @override
  Future<LoginState> executeLogin() {
    return _$executeLoginAsyncAction.run(() => super.executeLogin());
  }

  final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase');

  @override
  dynamic setState(LoginState value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmailText(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setEmailText');
    try {
      return super.setEmailText(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPasswordText(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setPasswordText');
    try {
      return super.setPasswordText(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
emailText: ${emailText},
passwordText: ${passwordText}
    ''';
  }
}

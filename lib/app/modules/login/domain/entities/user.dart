import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
class User extends Equatable {
  final String? uid;
  final String? name;
  final String? email;

  const User({this.uid, this.name, this.email});

  @override
  List<Object?> get props => [uid, name, email];
}

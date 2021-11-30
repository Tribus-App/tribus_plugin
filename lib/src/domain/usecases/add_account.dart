library church_plugin;
import 'package:church_plugin/src/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

abstract class AddAccount {
  Future<UserEntity> add(AddAccountParams params);
}

class AddAccountParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String document;
  final String birth;
  final String phone;

  List get props => [name, email, password, document, birth, phone];

  AddAccountParams({
    required this.name,
    required this.email,
    required this.password,
    required this.document,
    required this.birth,
    required this.phone,
  });
}

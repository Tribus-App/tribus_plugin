library church_plugin;
import 'dart:convert';

import 'address_entity.dart';
import 'social_network_entity.dart';

class UserEntity {
  final String? id;
  final String? token;
  final String? name;
  final String? email;
  final String? phone;
  final String? document;
  final String? password;
  final DateTime? birthDate;
  final AddressEntity? address;
  final String? image;
  final SocialNetworkEntity? socialNetwork;

  UserEntity({
    this.id,
    this.token,
    this.name,
    this.email,
    this.phone,
    this.document,
    this.password,
    this.birthDate,
    this.address,
    this.image,
    this.socialNetwork,
  });

  UserEntity copyWith({
    String? id,
    String? token,
    String? name,
    String? email,
    String? phone,
    String? document,
    String? password,
    DateTime? birthDate,
    AddressEntity? address,
    String? image,
    SocialNetworkEntity? socialNetwork,
  }) {
    return UserEntity(
      id: id ?? this.id,
      token: token ?? this.token,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      document: document ?? this.document,
      password: password ?? this.password,
      birthDate: birthDate ?? this.birthDate,
      address: address ?? this.address,
      image: image ?? this.image,
      socialNetwork: socialNetwork ?? this.socialNetwork,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'token': token,
      'name': name,
      'email': email,
      'phone': phone,
      'document': document,
      'password': password,
      'birthDate': birthDate?.millisecondsSinceEpoch,
      'address': address?.toMap(),
      'image': image,
      'socialNetwork': socialNetwork?.toMap(),
    };
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      token: map['token'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      document: map['document'],
      password: map['password'],
      // birthDate: DateTime.fromMillisecondsSinceEpoch(map['birthDate']),
      // address: AddressEntity.fromMap(map['address']),
      image: map['image'],
      // socialNetwork: SocialNetworkEntity.fromMap(map['socialNetwork']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserEntity.fromJson(String source) => UserEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserEntity(id: $id, token: $token, name: $name, email: $email, phone: $phone, document: $document, password: $password, birthDate: $birthDate, address: $address, image: $image, socialNetwork: $socialNetwork)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserEntity &&
      other.id == id &&
      other.token == token &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.document == document &&
      other.password == password &&
      other.birthDate == birthDate &&
      other.address == address &&
      other.image == image &&
      other.socialNetwork == socialNetwork;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      token.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      document.hashCode ^
      password.hashCode ^
      birthDate.hashCode ^
      address.hashCode ^
      image.hashCode ^
      socialNetwork.hashCode;
  }

  bool isLoggedin() {
    return this.id != null && this.id!.isNotEmpty && this.name != null && this.name!.isNotEmpty;
  }

  bool isImageValid() {
    return this.image != null && this.image!.isNotEmpty && this.image!.contains("http");
  }
}

library church_plugin;
import 'dart:convert';

import 'package:church_plugin/src/domain/entities/module_church_entity.dart';
import 'package:church_plugin/src/domain/entities/schedule_entity.dart';
import 'package:flutter/foundation.dart';

import 'address_entity.dart';
import 'payment_account_entity.dart';
import 'social_network_entity.dart';

class ChurchEntity {
  String name;
  String email;
  String image;
  String description;
  String? document;
  String id;
  String owner;
  String createdDate;
  String updatedDate;
  String phone;
  AddressEntity? address;
  List<String> category;
  PaymentAccountEntity? paymentAccount;
  SocialNetworkEntity? socialNetwork;
  List<ModuleChurchEntity> module;
  String? color;
  List<ScheduleEntity>? schedule;

  ChurchEntity({
    required this.name,
    required this.email,
    required this.image,
    required this.description,
    this.document,
    required this.id,
    required this.owner,
    required this.createdDate,
    required this.updatedDate,
    required this.phone,
    this.address,
    this.category = const [],
    this.paymentAccount,
    this.socialNetwork,
    this.module = const [],
    this.color,
    this.schedule,
  });

  ChurchEntity copyWith({
    String? name,
    String? email,
    String? image,
    String? description,
    String? document,
    String? id,
    String? owner,
    String? createdDate,
    String? updatedDate,
    String? phone,
    AddressEntity? address,
    List<String>? category,
    PaymentAccountEntity? paymentAccount,
    SocialNetworkEntity? socialNetwork,
    List<ModuleChurchEntity>? module,
    String? color,
    List<ScheduleEntity>? schedule,
  }) {
    return ChurchEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      description: description ?? this.description,
      document: document ?? this.document,
      id: id ?? this.id,
      owner: owner ?? this.owner,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      category: category ?? this.category,
      paymentAccount: paymentAccount ?? this.paymentAccount,
      socialNetwork: socialNetwork ?? this.socialNetwork,
      module: module ?? this.module,
      color: color ?? this.color,
      schedule: schedule ?? this.schedule,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'description': description,
      'document': document,
      'id': id,
      'owner': owner,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'phone': phone,
      'address': address?.toMap(),
      'category': category,
      'paymentAccount': paymentAccount?.toMap(),
      'socialNetwork': socialNetwork?.toMap(),
      'module': module.map((x) => x.toMap()).toList(),
      'color': color,
      'schedule': schedule?.map((x) => x.toMap()).toList(),
    };
  }

  Map<String, dynamic> toParams() {
    return {
      'name': name,
      'email': email,
      'image': image,
      'description': description,
      'document': document,
      'id': id,
      'owner': owner,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'phone': phone,
      'category': category,
      'color': color,
    };
  }

  factory ChurchEntity.fromMap(Map<String, dynamic> map) {
    return ChurchEntity(
      name: map['name'],
      email: map['email'],
      image: map['image'],
      description: map['description'],
      document: map['document'],
      id: map['id'],
      owner: map['owner'],
      createdDate: map['createdDate'],
      updatedDate: map['updatedDate'],
      phone: map['phone'] ?? map['telephone'],
      address: AddressEntity.fromMap(map['address'] ?? {}),
      category:
          map['category'] == null ? [] : List<String>.from(map['category']),
      paymentAccount: PaymentAccountEntity.fromMap(map['paymentAccount'] ?? {}),
      socialNetwork: SocialNetworkEntity.fromMap(map['socialNetwork'] ?? {}),
      module: map['module'] == null
          ? []
          : List<ModuleChurchEntity>.from(
              map['module']?.map((x) => ModuleChurchEntity.fromMap(x))),
      color: map['color'],
      schedule: map['schedule'] == null
          ? []
          : List<ScheduleEntity>.from(
              map['schedule']?.map((x) => ScheduleEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChurchEntity.fromJson(String source) =>
      ChurchEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChurchEntity(name: $name, email: $email, image: $image, description: $description, document: $document, id: $id, owner: $owner, createdDate: $createdDate, updatedDate: $updatedDate, phone: $phone, address: $address, category: $category, paymentAccount: $paymentAccount, socialNetwork: $socialNetwork, module: $module)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChurchEntity &&
        other.name == name &&
        other.email == email &&
        other.image == image &&
        other.description == description &&
        other.document == document &&
        other.id == id &&
        other.owner == owner &&
        other.createdDate == createdDate &&
        other.updatedDate == updatedDate &&
        other.phone == phone &&
        other.address == address &&
        listEquals(other.category, category) &&
        other.paymentAccount == paymentAccount &&
        other.socialNetwork == socialNetwork &&
        listEquals(other.module, module) &&
        other.color == color &&
        listEquals(other.schedule, schedule);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        image.hashCode ^
        description.hashCode ^
        document.hashCode ^
        id.hashCode ^
        owner.hashCode ^
        createdDate.hashCode ^
        updatedDate.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        category.hashCode ^
        paymentAccount.hashCode ^
        socialNetwork.hashCode ^
        module.hashCode ^
        color.hashCode ^
        schedule.hashCode;
  }
}

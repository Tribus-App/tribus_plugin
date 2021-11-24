import 'dart:convert';

import 'package:church_plugin/src/domain/entities/menu_entity.dart';
import 'package:flutter/foundation.dart';

class MenuCategoryEntity {
  String title;
  String? description;
  List<MenuEntity> products;
  int index;

  MenuCategoryEntity({
    required this.title,
    this.description,
    this.products = const [],
    required this.index,
  });

  MenuCategoryEntity copyWith({
    String? title,
    String? description,
    List<MenuEntity>? products,
    int? index,
  }) {
    return MenuCategoryEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      products: products ?? this.products,
      index: index ?? this.index,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'products': products.map((x) => x.toMap()).toList(),
      'index': index,
    };
  }

  factory MenuCategoryEntity.fromMap(Map<String, dynamic> map) {
    return MenuCategoryEntity(
      title: map['title'],
      description: map['description'],
      products: List<MenuEntity>.from(
          map['products']?.map((x) => MenuEntity.fromMap(x))),
      index: map['index'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuCategoryEntity.fromJson(String source) =>
      MenuCategoryEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuCategoryEntity(title: $title, description: $description, products: $products, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MenuCategoryEntity &&
        other.title == title &&
        other.description == description &&
        listEquals(other.products, products) &&
        other.index == index;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        products.hashCode ^
        index.hashCode;
  }
}

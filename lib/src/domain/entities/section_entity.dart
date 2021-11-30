library church_plugin;
import 'dart:convert';

import 'package:church_plugin/src/ui/components/cards/card_filter.dart';
import 'package:church_plugin/src/utils/adapter/theme.dart';
import 'package:flutter/material.dart';

class SectionEntity {
  String displayType;
  String resource;
  int index;
  String id;
  String? style;

  SectionEntity({
    required this.displayType,
    required this.resource,
    required this.index,
    required this.id,
    this.style,
  });

  SectionEntity copyWith({
    String? displayType,
    String? resource,
    int? index,
    String? id,
    String? style,
  }) {
    return SectionEntity(
      displayType: displayType ?? this.displayType,
      resource: resource ?? this.resource,
      index: index ?? this.index,
      id: id ?? this.id,
      style: style ?? this.style,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'displayType': displayType,
      'resource': resource,
      'index': index,
      'id': id,
      'style': style,
    };
  }

  factory SectionEntity.fromMap(Map<String, dynamic> map) {
    return SectionEntity(
      displayType: map['displayType'],
      resource: map['resource'],
      index: map['index'] ?? 99,
      id: map['id'] ?? map['_id'],
      style: map['style'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SectionEntity.fromJson(String source) =>
      SectionEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SectionEntity(displayType: $displayType, resource: $resource, index: $index, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SectionEntity &&
        other.displayType == displayType &&
        other.resource == resource &&
        other.index == index &&
        other.id == id &&
        other.style == style;
  }

  @override
  int get hashCode {
    return displayType.hashCode ^
        resource.hashCode ^
        index.hashCode ^
        id.hashCode ^
        style.hashCode;
  }

  Widget toWidget(BuildContext context) {
    if (isValid()) {
      switch (displayType.toString()) {
        case "TEXT":
          return Text(
            resource,
            style: ThemeAdapter.getTheme(style, context),
          );
        case "IMAGE":
          return Image.network(
            resource,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topCenter,
          );
        case "BUTTON_PRIMARY":
          return CardFilter(
            title: resource,
          );
        case "BUTTON_SECONDARY":
          return CardFilter(
            title: resource,
            selected: true,
          );
        case "DIVIDER":
          return SizedBox(
            height: double.tryParse(resource.toString()) ?? 20.0,
          );
      }
      return SizedBox();
    }
    return SizedBox();
  }

  bool isValid() {
    return true;
  }
}

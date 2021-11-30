library church_plugin;
import 'dart:convert';

import 'package:church_plugin/src/domain/entities/section_entity.dart';
import 'package:church_plugin/src/utils/adapter/icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageEntity {
  String name;
  String? description;
  IconData? icon;
  List<SectionEntity>? sections;
  bool disableAppBar;
  bool disableTextAppBar;
  String? router;

  PageEntity({
    required this.name,
    this.description,
    this.icon,
    this.sections,
    this.disableAppBar = false,
    this.disableTextAppBar = false,
    this.router,
  });

  PageEntity copyWith({
    String? name,
    String? description,
    IconData? icon,
    List<SectionEntity>? sections,
    bool? disableAppBar,
    bool? disableTextAppBar,
    String? router,
  }) {
    return PageEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      icon: icon ?? this.icon,
      sections: sections ?? this.sections,
      disableAppBar: disableAppBar ?? this.disableAppBar,
      disableTextAppBar: disableTextAppBar ?? this.disableTextAppBar,
      router: router ?? this.router,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'icon': icon?.codePoint,
      'sections': sections?.map((x) => x.toMap()).toList(),
      'disableAppBar': disableAppBar,
      'disableTextAppBar': disableTextAppBar,
      'router': router,
    };
  }

  factory PageEntity.fromMap(Map<String, dynamic> map) {
    return PageEntity(
      name: map['name'],
      description: map['description'],
      icon: IconAdapter.getIcon(map['icon']),
      sections: map['sections'] == null
          ? []
          : List<SectionEntity>.from(
              map['sections']?.map((x) => SectionEntity.fromMap(x))),
      disableAppBar: map['disableAppBar'] ?? false,
      disableTextAppBar: map['disableTextAppBar'] ?? false,
      router: map['router'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PageEntity.fromJson(String source) =>
      PageEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PageEntity(name: $name, description: $description, icon: $icon, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PageEntity &&
        other.name == name &&
        other.description == description &&
        other.icon == icon &&
        other.disableAppBar == disableAppBar &&
        other.disableTextAppBar == disableTextAppBar &&
        other.router == router &&
        listEquals(other.sections, sections);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        icon.hashCode ^
        disableAppBar.hashCode ^
        disableTextAppBar.hashCode ^
        router.hashCode ^
        sections.hashCode;
  }
}

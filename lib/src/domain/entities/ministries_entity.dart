import 'dart:convert';

import 'package:church_plugin/src/domain/entities/card_expanded_entity.dart';
import 'package:church_plugin/src/domain/entities/section_entity.dart';
import 'package:flutter/foundation.dart';

class MinistriesEntity {
  String title;
  String description;
  String? cover;
  String church;
  List<SectionEntity>? sections;

  MinistriesEntity({
    required this.title,
    required this.description,
    this.cover,
    required this.church,
    this.sections,
  });

  MinistriesEntity copyWith({
    String? title,
    String? description,
    String? cover,
    String? church,
    List<SectionEntity>? sections,
  }) {
    return MinistriesEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      cover: cover ?? this.cover,
      church: church ?? this.church,
      sections: sections ?? this.sections,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'cover': cover,
      'church': church,
      'sections': sections?.map((x) => x.toMap()).toList(),
    };
  }

  factory MinistriesEntity.fromMap(Map<String, dynamic> map) {
    String image = "";
    if (map['cover'] != null) {
      image = map['cover'];
      if (image.toString().contains("wix:image")) {
        List params = image.toString().split("/");
        image = "https://static.wixstatic.com/media/${params[3]}";
      }
    }
    return MinistriesEntity(
      title: map['title'],
      description: map['description'],
      cover: image,
      church: map['church'],
      sections: map['sections'] == null
          ? []
          : List<SectionEntity>.from(
              map['sections']?.map((x) => SectionEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory MinistriesEntity.fromJson(String source) =>
      MinistriesEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MinistriesEntity(title: $title, description: $description, cover: $cover, church: $church, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MinistriesEntity &&
        other.title == title &&
        other.description == description &&
        other.cover == cover &&
        other.church == church &&
        listEquals(other.sections, sections);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        cover.hashCode ^
        church.hashCode ^
        sections.hashCode;
  }

  CardExpandedEntity toCardExpandedEntity() {
    CardExpandedEntity cardExpandedEntity = CardExpandedEntity(
        name: title,
        description: description,
        image: cover,
        router: "/ministries-church-item",
        paramns: this);
    return cardExpandedEntity;
  }
}

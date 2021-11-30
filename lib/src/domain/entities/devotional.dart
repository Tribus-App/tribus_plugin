library church_plugin;
import 'dart:convert';

import 'package:church_plugin/src/domain/entities/user_entity.dart';

class DevotionalEntity {
  String title;
  String description;
  String? linkVideo;
  String? linkAudio;
  String? image;
  bool? isVisible;
  bool? isHighlighted;
  bool? preventCopies;
  UserEntity? user;
  String id;
  String owner;
  String createdAt;
  String updatedAt;

  DevotionalEntity({
    required this.title,
    required this.description,
    this.linkVideo,
    this.linkAudio,
    this.image,
    this.isVisible,
    this.isHighlighted,
    this.preventCopies,
    this.user,
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
  });

  DevotionalEntity copyWith({
    String? title,
    String? description,
    String? linkVideo,
    String? linkAudio,
    String? image,
    bool? isVisible,
    bool? isHighlighted,
    bool? preventCopies,
    UserEntity? user,
    String? id,
    String? owner,
    String? createdAt,
    String? updatedAt,
  }) {
    return DevotionalEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      linkVideo: linkVideo ?? this.linkVideo,
      linkAudio: linkAudio ?? this.linkAudio,
      image: image ?? this.image,
      isVisible: isVisible ?? this.isVisible,
      isHighlighted: isHighlighted ?? this.isHighlighted,
      preventCopies: preventCopies ?? this.preventCopies,
      user: user ?? this.user,
      id: id ?? this.id,
      owner: owner ?? this.owner,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'linkVideo': linkVideo,
      'linkAudio': linkAudio,
      'image': image,
      'isVisible': isVisible,
      'isHighlighted': isHighlighted,
      'preventCopies': preventCopies,
      'user': user?.toMap(),
      'id': id,
      'owner': owner,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory DevotionalEntity.fromMap(Map<String, dynamic> map) {
    return DevotionalEntity(
      title: map['title'],
      description: map['description'],
      linkVideo: map['linkVideo'] != null ? map['linkVideo'] : null,
      linkAudio: map['linkAudio'] != null ? map['linkAudio'] : null,
      image: map['image'] != null ? map['image'] : null,
      isVisible: map['isVisible'] != null ? map['isVisible'] : null,
      isHighlighted: map['isHighlighted'] != null ? map['isHighlighted'] : null,
      preventCopies: map['preventCopies'] != null ? map['preventCopies'] : null,
      user: map['user'] != null ? UserEntity.fromMap(map['user']) : null,
      id: map['id'],
      owner: map['owner'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DevotionalEntity.fromJson(String source) =>
      DevotionalEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DevotionalEntity(title: $title, description: $description, linkVideo: $linkVideo, linkAudio: $linkAudio, image: $image, isVisible: $isVisible, isHighlighted: $isHighlighted, preventCopies: $preventCopies, user: $user, id: $id, owner: $owner, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

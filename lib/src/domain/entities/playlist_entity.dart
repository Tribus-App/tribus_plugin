library church_plugin;
import 'dart:convert';

import 'package:church_plugin/src/domain/entities/video_entity.dart';

class PlaylistEntity {
  String title;
  String description;
  String image;
  int? index;
  List<VideoEntity?>? videos;
  String id;
  String owner;

  PlaylistEntity({
    required this.title,
    required this.description,
    required this.image,
    this.index,
    this.videos,
    required this.id,
    required this.owner,
  });

  PlaylistEntity copyWith({
    String? title,
    String? description,
    String? image,
    int? index,
    List<VideoEntity>? videos,
    String? id,
    String? owner,
  }) {
    return PlaylistEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      index: index ?? this.index,
      videos: videos ?? this.videos,
      id: id ?? this.id,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'index': index,
      'videos': videos?.map((x) => x?.toMap()).toList(),
      'id': id,
      'owner': owner,
    };
  }

  factory PlaylistEntity.fromMap(Map<String, dynamic> map) {
    return PlaylistEntity(
      title: map['title'],
      description: map['description'],
      image: map['image'],
      index: map['index'] != null ? map['index'] : null,
      videos: map['videos'] != null
          ? List<VideoEntity>.from(
              map['videos']?.map((x) => VideoEntity.fromMap(x)))
          : null,
      id: map['id'],
      owner: map['owner'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaylistEntity.fromJson(String source) =>
      PlaylistEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlaylistEntity(title: $title, description: $description, image: $image, index: $index, videos: $videos, id: $id, owner: $owner)';
  }
}

library church_plugin;
import 'dart:convert';

import 'package:church_plugin/src/domain/entities/card_expanded_entity.dart';
import 'package:church_plugin/src/domain/entities/download_entity.dart';
import 'package:church_plugin/src/domain/entities/playlist_entity.dart';

class VideoEntity {
  String title;
  String description;
  String linkVideo;
  String? linkAudio;
  String image;
  bool? isVisible;
  bool? isHighlighted;
  bool? preventCopies;
  List<PlaylistEntity?>? playlist;
  List<DownloadEntity?>? download;
  String id;
  String owner;

  VideoEntity({
    required this.title,
    required this.description,
    required this.linkVideo,
    this.linkAudio,
    required this.image,
    this.isVisible,
    this.isHighlighted,
    this.preventCopies,
    this.playlist,
    this.download,
    required this.id,
    required this.owner,
  });

  VideoEntity copyWith({
    String? title,
    String? description,
    String? linkVideo,
    String? linkAudio,
    String? image,
    bool? isVisible,
    bool? isHighlighted,
    bool? preventCopies,
    List<PlaylistEntity>? playlist,
    List<DownloadEntity>? download,
    String? id,
    String? owner,
  }) {
    return VideoEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      linkVideo: linkVideo ?? this.linkVideo,
      linkAudio: linkAudio ?? this.linkAudio,
      image: image ?? this.image,
      isVisible: isVisible ?? this.isVisible,
      isHighlighted: isHighlighted ?? this.isHighlighted,
      preventCopies: preventCopies ?? this.preventCopies,
      playlist: playlist ?? this.playlist,
      download: download ?? this.download,
      id: id ?? this.id,
      owner: owner ?? this.owner,
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
      'playlist': playlist?.map((x) => x?.toMap()).toList(),
      'download': download?.map((x) => x?.toMap()).toList(),
      'id': id,
      'owner': owner,
    };
  }

  factory VideoEntity.fromMap(Map<String, dynamic> map) {
    return VideoEntity(
      title: map['title'],
      description: map['description'],
      linkVideo: map['linkVideo'],
      linkAudio: map['linkAudio'] != null ? map['linkAudio'] : null,
      image: map['image'],
      isVisible: map['isVisible'] != null ? map['isVisible'] : null,
      isHighlighted: map['isHighlighted'] != null ? map['isHighlighted'] : null,
      preventCopies: map['preventCopies'] != null ? map['preventCopies'] : null,
      playlist: map['playlist'] != null
          ? List<PlaylistEntity>.from(
              map['playlist']?.map((x) => PlaylistEntity.fromMap(x)))
          : null,
      download: map['download'] != null
          ? List<DownloadEntity>.from(
              map['download']?.map((x) => DownloadEntity.fromMap(x)))
          : null,
      id: map['id'],
      owner: map['owner'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VideoEntity.fromJson(String source) =>
      VideoEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VideoEntity(title: $title, description: $description, linkVideo: $linkVideo, linkAudio: $linkAudio, image: $image, isVisible: $isVisible, isHighlighted: $isHighlighted, preventCopies: $preventCopies, playlist: $playlist, download: $download, id: $id, owner: $owner)';
  }

  CardExpandedEntity toCardExpandedEntity() {
    CardExpandedEntity cardExpandedEntity = CardExpandedEntity(
        name: title,
        description: description,
        image: image,
        router: "/video-church",
        paramns: this);
    return cardExpandedEntity;
  }
}

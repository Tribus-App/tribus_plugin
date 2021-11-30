library church_plugin;
import 'dart:convert';

import 'package:church_plugin/src/domain/entities/card_expanded_entity.dart';
import 'package:church_plugin/src/domain/entities/church_entity.dart';

class PostEntity {
  String title;
  String image;
  String excerpt;
  List<String>? hashtags;
  int? timeToRead;
  bool? pinned;
  bool? featured;
  int? viewCount;
  ChurchEntity? church;
  String id;
  String owner;
  String createdAt;
  String updatedAt;

  PostEntity({
    required this.title,
    required this.image,
    required this.excerpt,
    this.hashtags,
    this.timeToRead,
    this.pinned,
    this.featured,
    this.viewCount,
    this.church,
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
  });

  PostEntity copyWith({
    String? title,
    String? image,
    String? excerpt,
    List<String>? hashtags,
    int? timeToRead,
    bool? pinned,
    bool? featured,
    int? viewCount,
    ChurchEntity? church,
    String? id,
    String? owner,
    String? createdAt,
    String? updatedAt,
  }) {
    return PostEntity(
      title: title ?? this.title,
      image: image ?? this.image,
      excerpt: excerpt ?? this.excerpt,
      hashtags: hashtags ?? this.hashtags,
      timeToRead: timeToRead ?? this.timeToRead,
      pinned: pinned ?? this.pinned,
      featured: featured ?? this.featured,
      viewCount: viewCount ?? this.viewCount,
      church: church ?? this.church,
      id: id ?? this.id,
      owner: owner ?? this.owner,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'excerpt': excerpt,
      'hashtags': hashtags,
      'timeToRead': timeToRead,
      'pinned': pinned,
      'featured': featured,
      'viewCount': viewCount,
      'church': church?.toMap(),
      'id': id,
      'owner': owner,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory PostEntity.fromMap(Map<String, dynamic> map) {
    return PostEntity(
      title: map['title'],
      image: map['image'],
      excerpt: map['excerpt'],
      hashtags:
          map['hashtags'] != null ? List<String>.from(map['hashtags']) : null,
      timeToRead: map['timeToRead'] != null ? map['timeToRead'] : null,
      pinned: map['pinned'] != null ? map['pinned'] : null,
      featured: map['featured'] != null ? map['featured'] : null,
      viewCount: map['viewCount'] != null ? map['viewCount'] : null,
      // church: map['church'] != null ? ChurchEntity.fromMap(map['church']) : null,
      id: map['id'],
      owner: map['owner'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PostEntity.fromJson(String source) =>
      PostEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PostEntity(title: $title, image: $image, excerpt: $excerpt, hashtags: $hashtags, timeToRead: $timeToRead, pinned: $pinned, featured: $featured, viewCount: $viewCount, church: $church, id: $id, owner: $owner, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  CardExpandedEntity toCardExpandedEntity() {
    CardExpandedEntity cardExpandedEntity = CardExpandedEntity(
        name: title,
        description: excerpt,
        image: image,
        router: "/news-church-item",
        paramns: this);
    return cardExpandedEntity;
  }
}

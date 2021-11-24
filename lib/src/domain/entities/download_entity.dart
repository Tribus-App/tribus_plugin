import 'dart:convert';

class DownloadEntity {
  String title;
  String description;
  String link;
  String? image;
  int? index;
  bool? isVisible;
  String id;
  String owner;
  String createdAt;
  String updatedAt;
  
  DownloadEntity({
    required this.title,
    required this.description,
    required this.link,
    this.image,
    this.index,
    this.isVisible,
    required this.id,
    required this.owner,
    required this.createdAt,
    required this.updatedAt,
  });

  DownloadEntity copyWith({
    String? title,
    String? description,
    String? link,
    String? image,
    int? index,
    bool? isVisible,
    String? id,
    String? owner,
    String? createdAt,
    String? updatedAt,
  }) {
    return DownloadEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      link: link ?? this.link,
      image: image ?? this.image,
      index: index ?? this.index,
      isVisible: isVisible ?? this.isVisible,
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
      'link': link,
      'image': image,
      'index': index,
      'isVisible': isVisible,
      'id': id,
      'owner': owner,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory DownloadEntity.fromMap(Map<String, dynamic> map) {
    return DownloadEntity(
      title: map['title'],
      description: map['description'],
      link: map['link'],
      image: map['image'] != null ? map['image'] : null,
      index: map['index'] != null ? map['index'] : null,
      isVisible: map['isVisible'] != null ? map['isVisible'] : null,
      id: map['id'],
      owner: map['owner'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DownloadEntity.fromJson(String source) => DownloadEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DownloadEntity(title: $title, description: $description, link: $link, image: $image, index: $index, isVisible: $isVisible, id: $id, owner: $owner, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

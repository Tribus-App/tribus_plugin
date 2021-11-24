import 'dart:convert';

class CardExpandedEntity {
  String? name;
  String? description;
  String? image;
  String? router;
  dynamic paramns;

  CardExpandedEntity({
    this.name,
    this.description,
    this.image,
    this.router,
    this.paramns,
  });

  CardExpandedEntity copyWith({
    String? name,
    String? description,
    String? image,
    String? router,
    dynamic paramns,
  }) {
    return CardExpandedEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      router: router ?? this.router,
      paramns: paramns ?? this.paramns,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'router': router,
      'paramns': paramns,
    };
  }

  factory CardExpandedEntity.fromMap(Map<String, dynamic> map) {
    return CardExpandedEntity(
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      image: map['image'],
      router: map['router'],
      paramns: map['paramns'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CardExpandedEntity.fromJson(String source) => CardExpandedEntity.fromMap(json.decode(source));

  @override
  String toString() => 'CardExpandedEntity(name: $name, description: $description, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CardExpandedEntity &&
      other.name == name &&
      other.description == description &&
      other.image == image &&
      other.router == router;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ image.hashCode ^ router.hashCode;
}

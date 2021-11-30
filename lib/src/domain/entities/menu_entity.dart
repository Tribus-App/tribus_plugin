library church_plugin;
import 'dart:convert';

class MenuEntity {
  String title;
  String description;
  String? image;
  num? price;  

  MenuEntity({
    required this.title,
    required this.description,
    this.image,
    this.price,
  });

  MenuEntity copyWith({
    String? title,
    String? description,
    String? image,
    num? price,
  }) {
    return MenuEntity(
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'price': price,
    };
  }

  factory MenuEntity.fromMap(Map<String, dynamic> map) {
    String image = "";
    if(map['image'] != null) {
      image = map['image'];
      if(image.toString().contains("wix:image")) {
        List params = image.toString().split("/");
        image = "https://static.wixstatic.com/media/${params[3]}";
      }
    }
    return MenuEntity(
      title: map['title'],
      description: map['description'],
      image: image,
      price: map['price'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuEntity.fromJson(String source) => MenuEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuEntity(title: $title, description: $description, image: $image, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is MenuEntity &&
      other.title == title &&
      other.description == description &&
      other.image == image &&
      other.price == price;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      description.hashCode ^
      image.hashCode ^
      price.hashCode;
  }
}

import 'dart:convert';

class DonationEntity {
  String title;
  String? image;
  String? description;
  bool? isVisible;
  bool? isRecurrent;
  bool? isHighlighted;
  List<String> paymentMethods;
  String church;
  String id;

  DonationEntity({
    required this.title,
    this.image,
    this.description,
    this.isVisible,
    this.isRecurrent,
    this.isHighlighted,
    required this.paymentMethods,
    required this.church,
    required this.id,
  });

  DonationEntity copyWith({
    String? title,
    String? image,
    String? description,
    bool? isVisible,
    bool? isRecurrent,
    bool? isHighlighted,
    List<String>? paymentMethods,
    String? church,
    String? id,
  }) {
    return DonationEntity(
      title: title ?? this.title,
      image: image ?? this.image,
      description: description ?? this.description,
      isVisible: isVisible ?? this.isVisible,
      isRecurrent: isRecurrent ?? this.isRecurrent,
      isHighlighted: isHighlighted ?? this.isHighlighted,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      church: church ?? this.church,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'description': description,
      'isVisible': isVisible,
      'isRecurrent': isRecurrent,
      'isHighlighted': isHighlighted,
      'paymentMethods': paymentMethods,
      'church': church,
      'id': id,
    };
  }

  factory DonationEntity.fromMap(Map<String, dynamic> map) {
    return DonationEntity(
      title: map['title'],
      image: map['image'],
      description: map['description'] != null ? map['description'] : null,
      isVisible: map['isVisible'] != null ? map['isVisible'] : null,
      isRecurrent: map['isRecurrent'] != null ? map['isRecurrent'] : null,
      isHighlighted: map['isHighlighted'] != null ? map['isHighlighted'] : null,
      paymentMethods: List<String>.from(map['paymentMethods']),
      church: map['church'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DonationEntity.fromJson(String source) => DonationEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DonationEntity(title: $title, image: $image, description: $description, isVisible: $isVisible, isRecurrent: $isRecurrent, isHighlighted: $isHighlighted, paymentMethods: $paymentMethods, church: $church, id: $id)';
  }
}

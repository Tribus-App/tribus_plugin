library church_plugin;
import 'dart:convert';

class TagEntity {
  String type;
  
  TagEntity({
    required this.type,
  });

  TagEntity copyWith({
    String? type,
  }) {
    return TagEntity(
      type: type ?? this.type,
    );
  }

  @override
  String toString() => 'TagEntity(type: $type)';

  Map<String, dynamic> toMap() {
    return {
      'type': type,
    };
  }

  factory TagEntity.fromMap(Map<String, dynamic> map) {
    return TagEntity(
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TagEntity.fromJson(String source) => TagEntity.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TagEntity &&
      other.type == type;
  }

  @override
  int get hashCode => type.hashCode;
}

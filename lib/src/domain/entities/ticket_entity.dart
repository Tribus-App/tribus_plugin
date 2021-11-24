import 'dart:convert';

class TicketEntity {
  String? name;
  String? event;
  String? description;
  num? price;
  int? limitPerCheckout;
  String? cover;
  DateTime? start;
  DateTime? end;
  String? status;
  String? type;
  
  TicketEntity({
    this.name,
    this.event,
    this.description,
    this.price,
    this.limitPerCheckout,
    this.cover,
    this.start,
    this.end,
    this.status,
    this.type,
  });

  TicketEntity copyWith({
    String? name,
    String? event,
    String? description,
    num? price,
    int? limitPerCheckout,
    String? cover,
    DateTime? start,
    DateTime? end,
    String? status,
    String? type,
  }) {
    return TicketEntity(
      name: name ?? this.name,
      event: event ?? this.event,
      description: description ?? this.description,
      price: price ?? this.price,
      limitPerCheckout: limitPerCheckout ?? this.limitPerCheckout,
      cover: cover ?? this.cover,
      start: start ?? this.start,
      end: end ?? this.end,
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'event': event,
      'description': description,
      'price': price,
      'limitPerCheckout': limitPerCheckout,
      'cover': cover,
      'start': start?.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
      'status': status,
      'type': type,
    };
  }

  factory TicketEntity.fromMap(Map<String, dynamic> map) {
    return TicketEntity(
      name: map['name'],
      event: map['event'],
      description: map['description'],
      price: map['price'],
      limitPerCheckout: map['limitPerCheckout'],
      cover: map['cover'],
      start: DateTime.fromMillisecondsSinceEpoch(map['start']),
      end: DateTime.fromMillisecondsSinceEpoch(map['end']),
      status: map['status'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketEntity.fromJson(String source) => TicketEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicketEntity(name: $name, event: $event, description: $description, price: $price, limitPerCheckout: $limitPerCheckout, cover: $cover, start: $start, end: $end, status: $status, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TicketEntity &&
      other.name == name &&
      other.event == event &&
      other.description == description &&
      other.price == price &&
      other.limitPerCheckout == limitPerCheckout &&
      other.cover == cover &&
      other.start == start &&
      other.end == end &&
      other.status == status &&
      other.type == type;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      event.hashCode ^
      description.hashCode ^
      price.hashCode ^
      limitPerCheckout.hashCode ^
      cover.hashCode ^
      start.hashCode ^
      end.hashCode ^
      status.hashCode ^
      type.hashCode;
  }
}

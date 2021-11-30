library church_plugin;
import 'dart:convert';

class AddressEntity {
  String? nickname;
  String? postalCode;
  String? number;
  String road;
  String neighborhood;
  String city;
  String state;
  String? country;
  num? latitude;
  num? longitude;
  String? complement;
  String id;

  AddressEntity({
    this.nickname,
    this.postalCode,
    this.number,
    required this.road,
    required this.neighborhood,
    required this.city,
    required this.state,
    this.country,
    this.latitude,
    this.longitude,
    this.complement,
    required this.id,
  });
  

  AddressEntity copyWith({
    String? nickname,
    String? postalCode,
    String? number,
    String? road,
    String? neighborhood,
    String? city,
    String? state,
    String? country,
    num? latitude,
    num? longitude,
    String? complement,
    String? id,
  }) {
    return AddressEntity(
      nickname: nickname ?? this.nickname,
      postalCode: postalCode ?? this.postalCode,
      number: number ?? this.number,
      road: road ?? this.road,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      complement: complement ?? this.complement,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nickname': nickname,
      'postalCode': postalCode,
      'number': number,
      'road': road,
      'neighborhood': neighborhood,
      'city': city,
      'state': state,
      'country': country,
      'latitude': latitude,
      'longitude': longitude,
      'complement': complement,
      'id': id,
    };
  }

  factory AddressEntity.fromMap(Map<String, dynamic> map) {
    return AddressEntity(
      nickname: map['nickname'] != null ? map['nickname'] : null,
      postalCode: map['postalCode'] != null ? map['postalCode'] : null,
      number: map['number'] != null ? map['number'] : null,
      road: map['road'],
      neighborhood: map['neighborhood'],
      city: map['city'],
      state: map['state'],
      country: map['country'] != null ? map['country'] : null,
      latitude: map['latitude'] != null ? map['latitude'] : null,
      longitude: map['longitude'] != null ? map['longitude'] : null,
      complement: map['complement'] != null ? map['complement'] : null,
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressEntity.fromJson(String source) => AddressEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressEntity(nickname: $nickname, postalCode: $postalCode, number: $number, road: $road, neighborhood: $neighborhood, city: $city, state: $state, country: $country, latitude: $latitude, longitude: $longitude, complement: $complement, id: $id)';
  }
}

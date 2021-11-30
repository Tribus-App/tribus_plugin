library church_plugin;
import 'dart:convert';

class SocialNetworkEntity {
  String? facebook;
  String? instagram;
  String? whatsApp;
  String? twitter;
  String? youTube;
  String? telegram;
  
  SocialNetworkEntity({
    this.facebook,
    this.instagram,
    this.whatsApp,
    this.twitter,
    this.youTube,
    this.telegram,
  });

  SocialNetworkEntity copyWith({
    String? facebook,
    String? instagram,
    String? whatsApp,
    String? twitter,
    String? youTube,
    String? telegram,
  }) {
    return SocialNetworkEntity(
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      whatsApp: whatsApp ?? this.whatsApp,
      twitter: twitter ?? this.twitter,
      youTube: youTube ?? this.youTube,
      telegram: telegram ?? this.telegram,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'facebook': facebook,
      'instagram': instagram,
      'whatsApp': whatsApp,
      'twitter': twitter,
      'youTube': youTube,
      'telegram': telegram,
    };
  }

  factory SocialNetworkEntity.fromMap(Map<String, dynamic> map) {
    return SocialNetworkEntity(
      facebook: map['facebook'],
      instagram: map['instagram'],
      whatsApp: map['whatsApp'],
      twitter: map['twitter'],
      youTube: map['youTube'],
      telegram: map['telegram'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialNetworkEntity.fromJson(String source) => SocialNetworkEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SocialNetworkEntity(facebook: $facebook, instagram: $instagram, whatsApp: $whatsApp, twitter: $twitter, youTube: $youTube, telegram: $telegram)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SocialNetworkEntity &&
      other.facebook == facebook &&
      other.instagram == instagram &&
      other.whatsApp == whatsApp &&
      other.twitter == twitter &&
      other.youTube == youTube &&
      other.telegram == telegram;
  }

  @override
  int get hashCode {
    return facebook.hashCode ^
      instagram.hashCode ^
      whatsApp.hashCode ^
      twitter.hashCode ^
      youTube.hashCode ^
      telegram.hashCode;
  }
}

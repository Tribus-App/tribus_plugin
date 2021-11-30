library church_plugin;

import 'dart:convert';
import 'package:church_plugin/src/utils/i18n/route.dart';

class CountryLanguageEntity {
  String flag;
  String name;
  String countryCode;
  String languageCode;
  
  CountryLanguageEntity({
    required this.flag,
    required this.name,
    required this.countryCode,
    required this.languageCode,
  });

  @override
  String toString() {
    return 'CountryLanguageEntity(flag: $flag, name: $name, countryCode: $countryCode, languageCode: $languageCode)';
  }

  Map<String, dynamic> toMap() {
    return {
      'flag': flag,
      'name': name,
      'countryCode': countryCode,
      'languageCode': languageCode,
    };
  }

  factory CountryLanguageEntity.fromMap(Map<String, dynamic> map) {
    return CountryLanguageEntity(
      flag: map['flag'],
      name: map['name'],
      countryCode: map['countryCode'],
      languageCode: map['languageCode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryLanguageEntity.fromJson(String source) => CountryLanguageEntity.fromMap(json.decode(source));

  CountryLanguageEntity copyWith({
    String? flag,
    String? name,
    String? countryCode,
    String? languageCode,
  }) {
    return CountryLanguageEntity(
      flag: flag ?? this.flag,
      name: name ?? this.name,
      countryCode: countryCode ?? this.countryCode,
      languageCode: languageCode ?? this.languageCode,
    );
  }
}

CountryLanguageEntity verifyLanguage() {
  if(R.strings.about == PtBr().about) {
    return CountryLanguageEntity(
      flag: "assets/flag/brazil.png",
      name: R.strings.portugueseBrazil,
      countryCode: "BR",
      languageCode: "pt"
    );
  } else if(R.strings.about == EnUs().about) {
    return CountryLanguageEntity(
      flag: "assets/flag/united-states.png",
      name: R.strings.english,
      countryCode: "US",
      languageCode: "en"
    );
  } else {
    return CountryLanguageEntity(
      flag: "assets/flag/spain.png",
      name: R.strings.spanishLatinAmerica,
      countryCode: "ES",
      languageCode: "pt"
    );
  }
}

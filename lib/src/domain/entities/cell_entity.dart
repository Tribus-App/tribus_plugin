library church_plugin;
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'user_entity.dart';

class CellEntity {
  String title;
  List<UserEntity>? leaders;
  List<String> categories;
  String start;
  String end;
  List<UserEntity>? participants;
  String? local;
  String period;
  String dayOfTheWeek;
  String church;

  CellEntity({
    required this.title,
    this.leaders,
    this.categories = const [],
    required this.start,
    required this.end,
    this.participants,
    this.local,
    required this.period,
    required this.dayOfTheWeek,
    required this.church,
  });


  CellEntity copyWith({
    String? title,
    List<UserEntity>? leaders,
    List<String>? categories,
    String? start,
    String? end,
    List<UserEntity>? participants,
    String? local,
    String? period,
    String? dayOfTheWeek,
    String? church,
  }) {
    return CellEntity(
      title: title ?? this.title,
      leaders: leaders ?? this.leaders,
      categories: categories ?? this.categories,
      start: start ?? this.start,
      end: end ?? this.end,
      participants: participants ?? this.participants,
      local: local ?? this.local,
      period: period ?? this.period,
      dayOfTheWeek: dayOfTheWeek ?? this.dayOfTheWeek,
      church: church ?? this.church,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'leaders': leaders?.map((x) => x.toMap()).toList(),
      'categories': categories,
      'start': start,
      'end': end,
      'participants': participants?.map((x) => x.toMap()).toList(),
      'local': local,
      'period': period,
      'dayOfTheWeek': dayOfTheWeek,
      'church': church,
    };
  }

  factory CellEntity.fromMap(Map<String, dynamic> map) {
    DateTime start = DateTime.now();
    start = DateTime.parse("2020-07-01 ${map['start'].toString().split(":")[0]}:${map['start'].toString().split(":")[1]}");
    start = DateTime.utc(start.year, start.month, start.day, start.hour, start.minute);

    DateTime end = DateTime.now();
    end = DateTime.parse("2020-07-01 ${map['end'].toString().split(":")[0]}:${map['end'].toString().split(":")[1]}");
    end = DateTime.utc(end.year, end.month, end.day, end.hour, end.minute);

    return CellEntity(
      title: map['title'],
      leaders: map['leaders'] == null ? [] :List<UserEntity>.from(map['leaders']?.map((x) => UserEntity.fromMap(x))),
      categories: map['categories'] == null ? [] :List<String>.from(map['categories']),
      start: "${DateFormat("HH:mm").format(DateTime.parse(start.toLocal().toString()))}",
      end: "${DateFormat("HH:mm").format(DateTime.parse(end.toLocal().toString()))}",
      participants: map['participants'] == null ? [] :List<UserEntity>.from(map['participants']?.map((x) => UserEntity.fromMap(x))),
      local: map['local'],
      period: map['period'],
      dayOfTheWeek: map['dayOfTheWeek'],
      church: map['church'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CellEntity.fromJson(String source) => CellEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CellEntity(title: $title, leaders: $leaders, categories: $categories, start: $start, end: $end, participants: $participants, local: $local, period: $period, dayOfTheWeek: $dayOfTheWeek, church: $church)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CellEntity &&
      other.title == title &&
      listEquals(other.leaders, leaders) &&
      listEquals(other.categories, categories) &&
      other.start == start &&
      other.end == end &&
      listEquals(other.participants, participants) &&
      other.local == local &&
      other.period == period &&
      other.dayOfTheWeek == dayOfTheWeek &&
      other.church == church;
  }

  @override
  int get hashCode {
    return title.hashCode ^
      leaders.hashCode ^
      categories.hashCode ^
      start.hashCode ^
      end.hashCode ^
      participants.hashCode ^
      local.hashCode ^
      period.hashCode ^
      dayOfTheWeek.hashCode ^
      church.hashCode;
  }
}

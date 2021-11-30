library church_plugin;
import 'dart:convert';

import 'package:intl/intl.dart';

class ScheduleEntity {
  String dayOfTheWeek;
  String time;
  String name;
  String period;
  String church;

  ScheduleEntity({
    required this.dayOfTheWeek,
    required this.time,
    required this.name,
    required this.period,
    required this.church,
  });

  ScheduleEntity copyWith({
    String? dayOfTheWeek,
    String? time,
    String? name,
    String? period,
    String? church,
  }) {
    return ScheduleEntity(
      dayOfTheWeek: dayOfTheWeek ?? this.dayOfTheWeek,
      time: time ?? this.time,
      name: name ?? this.name,
      period: period ?? this.period,
      church: church ?? this.church,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dayOfTheWeek': dayOfTheWeek,
      'time': time,
      'name': name,
      'period': period,
      'church': church,
    };
  }

  factory ScheduleEntity.fromMap(Map<String, dynamic> map) {
    DateTime start = DateTime.now();
    start = DateTime.parse("2020-07-01 ${map['time'].toString().split(":")[0]}:${map['time'].toString().split(":")[1]}");
    start = DateTime.utc(start.year, start.month, start.day, start.hour, start.minute);

    return ScheduleEntity(
      dayOfTheWeek: map['dayOfTheWeek'],
      time: "${DateFormat("HH:mm").format(DateTime.parse(start.toLocal().toString()))}",
      name: map['name'],
      period: map['period'],
      church: map['church'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleEntity.fromJson(String source) => ScheduleEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ScheduleEntity(dayOfTheWeek: $dayOfTheWeek, time: $time, name: $name, period: $period, church: $church)';
  }
}

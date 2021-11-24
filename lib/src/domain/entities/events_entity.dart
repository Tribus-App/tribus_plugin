import 'dart:convert';

import 'package:church_plugin/src/domain/entities/card_expanded_entity.dart';
import 'package:church_plugin/src/domain/entities/church_entity.dart';
import 'package:flutter/foundation.dart';

import 'tag_entity.dart';
import 'ticket_entity.dart';
import 'user_entity.dart';

class EventEntity {
  String title;
  String? slug;
  String description;
  String? about;
  String? cover;
  DateTime? start;
  DateTime? end;
  String? status;
  String? type;
  List<TagEntity>? tags;
  int? capacity;
  ChurchEntity? church;
  String? locationName;
  List<UserEntity>? members;
  int? remainingTickets;
  List<TicketEntity>? tickets;
  List<UserEntity>? waitingList;
  List<UserEntity>? panelists;

  EventEntity({
    required this.title,
    this.slug,
    required this.description,
    this.about,
    this.cover,
    this.start,
    this.end,
    this.status,
    this.type,
    this.tags,
    this.capacity,
    this.church,
    this.locationName,
    this.members,
    this.remainingTickets,
    this.tickets,
    this.waitingList,
    this.panelists,
  });

  EventEntity copyWith({
    String? title,
    String? slug,
    String? description,
    String? about,
    String? cover,
    DateTime? start,
    DateTime? end,
    String? status,
    String? type,
    List<TagEntity>? tags,
    int? capacity,
    ChurchEntity? church,
    String? locationName,
    List<UserEntity>? members,
    int? remainingTickets,
    List<TicketEntity>? tickets,
    List<UserEntity>? waitingList,
    List<UserEntity>? panelists,
  }) {
    return EventEntity(
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      about: about ?? this.about,
      cover: cover ?? this.cover,
      start: start ?? this.start,
      end: end ?? this.end,
      status: status ?? this.status,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      capacity: capacity ?? this.capacity,
      church: church ?? this.church,
      locationName: locationName ?? this.locationName,
      members: members ?? this.members,
      remainingTickets: remainingTickets ?? this.remainingTickets,
      tickets: tickets ?? this.tickets,
      waitingList: waitingList ?? this.waitingList,
      panelists: panelists ?? this.panelists,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'slug': slug,
      'description': description,
      'about': about,
      'cover': cover,
      'start': start?.millisecondsSinceEpoch,
      'end': end?.millisecondsSinceEpoch,
      'status': status,
      'type': type,
      'tags': tags?.map((x) => x.toMap()).toList(),
      'capacity': capacity,
      'church': church?.toMap(),
      'locationName': locationName,
      'members': members?.map((x) => x.toMap()).toList(),
      'remainingTickets': remainingTickets,
      'tickets': tickets?.map((x) => x.toMap()).toList(),
      'waitingList': waitingList?.map((x) => x.toMap()).toList(),
      'panelists': panelists?.map((x) => x.toMap()).toList(),
    };
  }

  factory EventEntity.fromMap(Map<String, dynamic> map) {
    String image = "";
    if (map['cover'] != null) {
      image = map['cover'];
      if (image.toString().contains("wix:image")) {
        List params = image.toString().split("/");
        image = "https://static.wixstatic.com/media/${params[3]}";
      }
    }
    return EventEntity(
      title: map['title'] ?? "",
      slug: map['slug'] ?? "",
      description: map['description'] ?? "",
      about: map['about'] ?? "",
      cover: image,
      // start: DateTime.fromMillisecondsSinceEpoch(map['start']),
      // end: DateTime.fromMillisecondsSinceEpoch(map['end']),
      status: map['status'] ?? "",
      type: map['type'] ?? "",
      // tags: map['tags'] == null ? [] : List<TagEntity>.from(map['tags']?.map((x) => TagEntity.fromMap(x))),
      capacity: int.tryParse(map['capacity'].toString()) ?? 0,
      // church: map['church'] == null ? null : ChurchEntity.fromMap(map['church']),
      locationName: map['locationName'] ?? "",
      members: map['members'] == null
          ? []
          : List<UserEntity>.from(
              map['members']?.map((x) => UserEntity.fromMap(x))),
      remainingTickets: int.tryParse(map['remainingTickets'].toString()) ?? 0,
      tickets: map['tickets'] == null
          ? []
          : List<TicketEntity>.from(
              map['tickets']?.map((x) => TicketEntity.fromMap(x))),
      waitingList: map['waitingList'] == null
          ? []
          : List<UserEntity>.from(
              map['waitingList']?.map((x) => UserEntity.fromMap(x))),
      panelists: map['panelists'] == null
          ? []
          : List<UserEntity>.from(
              map['panelists']?.map((x) => UserEntity.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventEntity.fromJson(String source) =>
      EventEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventEntity(title: $title, slug: $slug, description: $description, about: $about, cover: $cover, start: $start, end: $end, status: $status, type: $type, tags: $tags, capacity: $capacity, church: $church, locationName: $locationName, members: $members, remainingTickets: $remainingTickets, tickets: $tickets, waitingList: $waitingList, panelists: $panelists)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventEntity &&
        other.title == title &&
        other.slug == slug &&
        other.description == description &&
        other.about == about &&
        other.cover == cover &&
        other.start == start &&
        other.end == end &&
        other.status == status &&
        other.type == type &&
        listEquals(other.tags, tags) &&
        other.capacity == capacity &&
        other.church == church &&
        other.locationName == locationName &&
        listEquals(other.members, members) &&
        other.remainingTickets == remainingTickets &&
        listEquals(other.tickets, tickets) &&
        listEquals(other.waitingList, waitingList) &&
        listEquals(other.panelists, panelists);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        slug.hashCode ^
        description.hashCode ^
        about.hashCode ^
        cover.hashCode ^
        start.hashCode ^
        end.hashCode ^
        status.hashCode ^
        type.hashCode ^
        tags.hashCode ^
        capacity.hashCode ^
        church.hashCode ^
        locationName.hashCode ^
        members.hashCode ^
        remainingTickets.hashCode ^
        tickets.hashCode ^
        waitingList.hashCode ^
        panelists.hashCode;
  }

  CardExpandedEntity toCardExpandedEntity() {
    CardExpandedEntity cardExpandedEntity = CardExpandedEntity(
        name: title,
        description: slug,
        image: cover,
        router: "/event-church-item",
        paramns: this);
    return cardExpandedEntity;
  }
}

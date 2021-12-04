library church_plugin;
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:church_plugin/src/domain/entities/module_church_entity.dart';
import 'package:church_plugin/src/utils/adapter/icons.dart';
import 'package:church_plugin/src/utils/i18n/resources.dart';

class ModuleEntity {
  String name;
  String description;
  String displayType;
  String slug;
  String overview;
  String image;
  List<String> keyPoints;
  String? router;
  String? apiRouter;
  String? label;
  String? language;
  Map<String, dynamic> params;
  IconData? icon;
  int index;
  int? minimalVersion;
  bool isNew;
  String? id;
  String? owner;
  String? createdDate;
  String? updatedDate;
  
  ModuleEntity({
    required this.name,
    required this.description,
    required this.displayType,
    required this.slug,
    required this.overview,
    required this.image,
    required this.keyPoints,
    this.router,
    this.apiRouter,
    this.label,
    this.language,
    this.params = const {},
    this.icon,
    required this.index,
    this.minimalVersion,
    this.isNew = false,
    this.id,
    this.owner,
    this.createdDate,
    this.updatedDate,
  });


  ///////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////

  ModuleChurchEntity toModuleChurch() {
    ModuleChurchEntity moduleChurchEntity = ModuleChurchEntity(
      name: name,
      description: description,
      index: index,
      displayType: displayType,
      module: this,
    );
    return moduleChurchEntity;
  }

  bool isModuleValid() {
    if (name.toString() != "null" &&
        name.length > 0 &&
        description.toString() != "null" &&
        description.length > 0 &&
        icon.toString() != "null" &&
        icon.toString().length > 0 &&
        router.toString() != "null" &&
        router!.length > 0) {
      return true;
    }
    return false;
  }

  ModuleEntity copyWith({
    String? name,
    String? description,
    String? displayType,
    String? slug,
    String? overview,
    String? image,
    List<String>? keyPoints,
    String? router,
    String? apiRouter,
    String? label,
    String? language,
    Map<String, dynamic>? params,
    IconData? icon,
    int? index,
    int? minimalVersion,
    bool? isNew,
    String? id,
    String? owner,
    String? createdDate,
    String? updatedDate,
  }) {
    return ModuleEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      displayType: displayType ?? this.displayType,
      slug: slug ?? this.slug,
      overview: overview ?? this.overview,
      image: image ?? this.image,
      keyPoints: keyPoints ?? this.keyPoints,
      router: router ?? this.router,
      apiRouter: apiRouter ?? this.apiRouter,
      label: label ?? this.label,
      language: language ?? this.language,
      params: params ?? this.params,
      icon: icon ?? this.icon,
      index: index ?? this.index,
      minimalVersion: minimalVersion ?? this.minimalVersion,
      isNew: isNew ?? this.isNew,
      id: id ?? this.id,
      owner: owner ?? this.owner,
      createdDate: createdDate ?? this.createdDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'displayType': displayType,
      'slug': slug,
      'overview': overview,
      'image': image,
      'keyPoints': keyPoints,
      'router': router,
      'apiRouter': apiRouter,
      'label': label,
      'language': language,
      'params': params,
      'icon': icon?.codePoint,
      'index': index,
      'minimalVersion': minimalVersion,
      'isNew': isNew,
      'id': id,
      'owner': owner,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
    };
  }

  factory ModuleEntity.fromMap(Map<String, dynamic> map) {

    Map<String, dynamic> params = {};

    if (map['params'] != null) {
      params.addAll(map['params']);
    }
    
    return ModuleEntity(
      name: map['name'] ?? "",
      description: map['description'] ?? "",
      displayType: map['displayType'],
      slug: map['slug'],
      overview: map['overview'],
      image: map['image'],
      keyPoints: List<String>.from(map['keyPoints']),
      router: map['router'] != null ? map['router'] : null,
      apiRouter: map['apiRouter'] != null ? map['apiRouter'] : null,
      label: map['label'] ?? R.strings.access,
      language: map['language'] != null ? map['language'] : null,
      icon: IconAdapter.getIcon(map['icon']),
      index: map['index'] ?? 99,
      minimalVersion: map['minimalVersion'] ?? 1000,
      isNew: map['isNew'] ?? false,
      id: map['id'] ?? map['_id'],
      owner: map['owner'] ?? map['_owner'],
      createdDate: map['createdDate'] ??  map['_createdDate'],
      updatedDate: map['updatedDate'] ?? map['_updatedDate'],
      params: params,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModuleEntity.fromJson(String source) => ModuleEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModuleEntity(name: $name, description: $description, displayType: $displayType, slug: $slug, overview: $overview, image: $image, keyPoints: $keyPoints, router: $router, apiRouter: $apiRouter, label: $label, language: $language, params: $params, icon: $icon, index: $index, minimalVersion: $minimalVersion, isNew: $isNew, id: $id, owner: $owner, createdDate: $createdDate, updatedDate: $updatedDate)';
  }
}

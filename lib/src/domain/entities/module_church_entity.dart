import 'dart:convert';

import 'package:church_plugin/src/domain/entities/module_entity.dart';
import 'package:church_plugin/src/ui/components/cards/card_basic_widget.dart';
import 'package:church_plugin/src/ui/components/cards/card_box_module.dart';
import 'package:church_plugin/src/ui/components/cards/card_discover_module.dart';
import 'package:church_plugin/src/ui/components/cards/card_basic_horizontal_scroll_widget.dart';
import 'package:church_plugin/src/ui/components/cards/card_image_horizontal_scroll_widget.dart';
import 'package:church_plugin/src/ui/components/cards/card_shortcut_module.dart';
import 'package:church_plugin/src/utils/i18n/resources.dart';

class ModuleChurchEntity {
  String name;
  String description;
  String displayType;
  int index;
  ModuleEntity module;

  ModuleChurchEntity({
    required this.name,
    required this.description,
    required this.displayType,
    required this.index,
    required this.module,
  });

  ModuleChurchEntity copyWith({
    String? name,
    String? description,
    String? displayType,
    int? index,
    ModuleEntity? module,
  }) {
    return ModuleChurchEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      displayType: displayType ?? this.displayType,
      index: index ?? this.index,
      module: module ?? this.module,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'displayType': displayType,
      'index': index,
      'module': module.toMap(),
    };
  }

  factory ModuleChurchEntity.fromMap(Map<String, dynamic> map) {
    return ModuleChurchEntity(
      name: map['name'] != null && map["name"].toString().isNotEmpty
          ? map['name']
          : map['module']["name"],
      description:
          map['description'] != null && map["description"].toString().isNotEmpty
              ? map['description']
              : map['module']["description"],
      displayType:
          map['displayType'] != null && map["displayType"].toString().isNotEmpty
              ? map['displayType']
              : map['module']["displayType"],
      index: map['index'] ?? map['module']["index"],
      module: ModuleEntity.fromMap(map['module']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModuleChurchEntity.fromJson(String source) =>
      ModuleChurchEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ModuleChurchEntity(name: $name, description: $description, displayType: $displayType, index: $index, module: $module)';
  }

  ToCardBasic toCardBasic() {
    ToCardBasic toCardBasic = ToCardBasic(
      icon: module.icon!,
      name: name,
      isNew: module.isNew,
      module: this,
    );
    return toCardBasic;
  }

  ToCardHorizontalScroll toCardHorizontalScroll() {
    ToCardHorizontalScroll toCardHorizontalScroll = ToCardHorizontalScroll(
      description: description,
      isNew: module.isNew,
      module: this,
    );
    return toCardHorizontalScroll;
  }

  ToCardImageHorizontalScrollWidget toCardImageHorizontalScrollWidget() {
    ToCardImageHorizontalScrollWidget toCardImageHorizontalScrollWidget =
        ToCardImageHorizontalScrollWidget(
      description: description,
      isNew: module.isNew,
      module: this,
    );
    return toCardImageHorizontalScrollWidget;
  }

  ToCardBox toCardBox() {
    ToCardBox toCardBox = ToCardBox(
      icon: module.icon!,
      name: name,
      description: module.description,
      module: this,
    );
    return toCardBox;
  }

  ToCardShortcut toCardShortcut() {
    ToCardShortcut toCardShortcut = ToCardShortcut(
      icon: module.icon!,
      name: name,
      isNew: module.isNew,
      module: this,
    );
    return toCardShortcut;
  }

  ToCardDiscover toCardDiscover() {
    ToCardDiscover toCardDiscover = ToCardDiscover(
      icon: module.icon!,
      name: name,
      description: module.description,
      label: module.label ?? R.strings.access,
      module: this,
    );
    return toCardDiscover;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ModuleChurchEntity &&
        other.name == name &&
        other.description == description &&
        other.displayType == displayType &&
        other.index == index &&
        other.module == module;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        description.hashCode ^
        displayType.hashCode ^
        index.hashCode ^
        module.hashCode;
  }
}

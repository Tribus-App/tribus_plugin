import 'package:flutter/material.dart';

class ShortcutsEntity {
  final String title;
  final String? description;
  final bool marked;
  final bool isNew;
  final IconData? icon;
  final String? router;
  final dynamic params;

  ShortcutsEntity({
    required this.title,
    this.description,
    this.marked = false,
    this.isNew = false,
    this.icon,
    this.router,
    this.params,
  });

  bool isValid() {
    if(title.toString() != "null" 
      && title.length > 0
      && description.toString() != "null" 
      && description!.length > 0
      && icon.toString() != "null" 
      && icon.toString().length > 0
      && router.toString() != "null" 
      && router!.length > 0
    ) {
      return true;
    }
    return false;
  }
}

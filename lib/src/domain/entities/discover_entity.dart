import 'package:flutter/material.dart';

class DiscoverEntity {
  final String title;
  final String description;
  final String? router;
  final String label;
  final IconData? icon;
  final dynamic params;

  DiscoverEntity({
    required this.title,
    required this.description,
    this.router,
    required this.label,
    this.icon,
    this.params,
  });

  bool isValid() {
    if(title.toString() != "null" 
      && title.length > 0
      && description.toString() != "null" 
      && description.length > 0
      && router.toString() != "null" 
      && router!.length > 0
    ) {
      return true;
    }
    return false;
  }

}
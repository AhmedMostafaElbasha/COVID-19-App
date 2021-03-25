import 'package:flutter/material.dart';

class Symptom {
  final String imagePath;
  final String title;
  bool isActive;

  Symptom({
    @required this.imagePath,
    @required this.title,
    this.isActive = false,
  });
}

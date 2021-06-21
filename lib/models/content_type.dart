import 'package:flutter/material.dart';

class ContentType {
  ContentType({
    required this.name,
    required this.height,
    required this.width,
    required this.pixelRatio,
  });
  final String name;
  final double height;
  final double width;
  final double pixelRatio;

  ContentType copyWith({
    String? name,
    double? height,
    double? width,
    double? pixelRatio,
  }) {
    return ContentType(
      name: name ?? this.name,
      height: height ?? this.height,
      width: width ?? this.width,
      pixelRatio: pixelRatio ?? this.pixelRatio,
    );
  }
}

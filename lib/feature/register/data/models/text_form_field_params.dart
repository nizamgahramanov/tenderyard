import 'package:flutter/material.dart';

enum FieldType {
  textFormField,
  dropdown,
  container,
}

class FieldParams {
  final int id;
  final String title;
  final String? hintText;
  final Widget? trailingIcon;
  final TextInputAction textInputAction;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType keyboardType;
  final List<String>? dropdownItems;
  final FieldType type;
  FieldParams({
    required this.id,
    required this.title,
    this.hintText,
    this.trailingIcon,
    required this.focusNode,
    required this.textInputAction,
    required this.keyboardType,
    this.decoration,
    this.dropdownItems,
    required this.type
  });
}

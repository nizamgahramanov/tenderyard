import 'package:flutter/material.dart';

class ShadowTextFormField extends StatelessWidget {
  final FocusNode focusNode;
  final String initialValue;
  final TextStyle style;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onChanged;

  const ShadowTextFormField({
    Key? key,
    required this.focusNode,
    required this.initialValue,
    required this.style,
    required this.decoration,
    required this.keyboardType,
    required this.textInputAction,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          if (focusNode.hasFocus)
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: TextFormField(
        focusNode: focusNode,
        initialValue: initialValue,
        style: style,
        decoration: decoration,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onChanged: onChanged,
      ),
    );
  }
}

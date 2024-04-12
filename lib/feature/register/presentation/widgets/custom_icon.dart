import 'package:flutter/material.dart';
import 'package:tenderyard/feature/app/app_theme/color_utils.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.keyboard_arrow_down,
      color: ColorUtils.tertiaryColor,
    );
  }
}

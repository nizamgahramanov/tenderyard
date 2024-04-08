import 'package:flutter/material.dart';

import 'color_utils.dart';

class StyleUtils {
  StyleUtils._();

  static const fontPoppins = 'Poppins';

  static TextStyle? boldTitle(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.w400,
          color: ColorUtils.primaryTitleColor(context),
          fontSize: 20
        );
  }

  static TextStyle? bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: ColorUtils.tertiaryColor
        );
  }

  static TextStyle? bodyRegular(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w400,
          color: ColorUtils.primaryColor,
          fontSize: 16,
        );
  }

  static TextStyle? commonButton(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 16,
          backgroundColor: ColorUtils.primaryButtonBackgroundColor(context),
          fontFamily: fontPoppins,
          color: ColorUtils.primaryButtonTextColor(context),
        );
  }
}

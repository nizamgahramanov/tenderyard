import 'package:flutter/material.dart';

import 'color_utils.dart';
import 'style_utils.dart';


abstract class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(49, 49, 49, 1),
        ),
      ),
      dividerColor: const Color.fromRGBO(232, 232, 232, 1),

      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        labelStyle: const TextStyle(
          color: Color.fromRGBO(49, 49, 49, 1),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(
            color: Color.fromRGBO(209, 209, 209, 1),
            width: 0.5,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor:  ColorUtils.bodyWhiteColor,
        filled: true,
        suffixIconColor:  ColorUtils.bodyTertiaryTextColor,
        hintStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),

        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorUtils.secondaryColor,
            padding:  EdgeInsets.zero,
            minimumSize: const Size.fromHeight(54),
            // enabledMouseCursor: MouseCursor.defer,
            // foregroundColor: backgroundColor.withOpacity(0.8),
            elevation: 0,
            shadowColor: Colors.transparent,

            // shadowColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            )
        ),
      ),

      textTheme: TextTheme(

        headlineLarge: headlineLargeStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),
        headlineMedium: headlineMediumStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),
        headlineSmall: headlineSmallStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),

        titleLarge: titleLargeStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),
        titleMedium: titleMediumStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),
        titleSmall: titleSmallStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),

        bodyLarge: bodyLargeStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),
        bodyMedium: bodyMediumStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),
        bodySmall: bodySmallStyle.copyWith(
          color: ColorUtils.bodyPrimaryTextColor,
        ),
      ),
    );
  }

  // **************************** TextStyles here ****************************



  static const headlineLargeStyle = TextStyle(
    fontSize: 30,
    fontFamily: StyleUtils.fontPoppins,
  );
  static const headlineMediumStyle = TextStyle(
    fontSize: 26,
    fontFamily: StyleUtils.fontPoppins,
  );
  static const headlineSmallStyle = TextStyle(
    fontSize: 24,
    fontFamily: StyleUtils.fontPoppins,
  );


  static const titleLargeStyle = TextStyle(
    fontSize: 20,
    fontFamily: StyleUtils.fontPoppins,
  );
  static const titleMediumStyle = TextStyle(
    fontSize: 18,
    fontFamily: StyleUtils.fontPoppins,
  );
  static const titleSmallStyle = TextStyle(
    fontSize: 16,
    fontFamily: StyleUtils.fontPoppins,
  );


  static const bodyLargeStyle = TextStyle(
    fontSize: 16,
    fontFamily: StyleUtils.fontPoppins,
  );
  static const bodyMediumStyle = TextStyle(
    fontSize: 14,
    fontFamily: StyleUtils.fontPoppins,
  );
  static const bodySmallStyle = TextStyle(
    fontSize: 12,
    fontFamily: StyleUtils.fontPoppins,
  );
}


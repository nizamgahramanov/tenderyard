import 'package:flutter/material.dart';


class ColorUtils{
  ColorUtils._();

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static bool isLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;



  static Color loginPageBackground(BuildContext context){
    return bodyWhiteColor;
  }

  static Color allPagesBackground(BuildContext context){
    return primaryColor;
  }
  static Color primaryTitleColor(BuildContext context){
    return bodyPrimaryTextColor;
  }

  static Color primarySubtitleColor(BuildContext context){
    return bodySecondaryTextColor;
  }
  static Color tertiarySubtitleColor(BuildContext context){
    return secondaryColor;
  }

  static Color primaryButtonBackgroundColor(BuildContext context){
    return secondaryColor;
  }
  static Color secondaryButtonBackgroundColor(BuildContext context){
    return bodyWhiteColor;
  }
  static Color primaryButtonTextColor(BuildContext context){
    return bodyWhiteColor;
  }
  static Color secondaryButtonTextColor(BuildContext context){
    return secondaryColor;
  }

  // **************************** Colors here ****************************
  static const primaryColor = Color(0xFF035762);
  static const secondaryColor = Color(0xFF696F79);
  static const tertiaryColor = Color(0xFF8692A6);



  static const bodyPrimaryTextColor =  Color(0xFF000000);
  static const bodySecondaryTextColor =  Color(0xFF494949);
  static const bodyTertiaryTextColor =  Color(0xFF60778C);
  static const bodyWhiteColor =  Color(0xFFFFFFFF);
  static const selectedTileColor =  Color(0xFFF5F9FF);
  static const shadowColor = Color(0xFF99ABC6);
  static const homeSurveyButtonColor = Color(0xFF00ADEE);
  static const homeVideoButtonColor = Color(0xFFE8DD13);
  static const slideDotColor = Color(0xFFEDEDED);
  static const videoPopupColor = Color(0xFF3E4958);


}
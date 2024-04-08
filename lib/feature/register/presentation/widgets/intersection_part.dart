import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tenderyard/feature/app/app_theme/color_utils.dart';
import 'package:tenderyard/feature/app/app_theme/style_utils.dart';

class IntersectionPart extends StatelessWidget {
  const IntersectionPart({super.key, required this.intersectionHeight});

  final double intersectionHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: ColorUtils.bodyWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: intersectionHeight,
      child: Column(
        children: [
          Text(
            "Hüquqi şəxs / Şəxsi məlumatlar",
            style: StyleUtils.bodyRegular(context)!.copyWith(
              fontWeight: FontWeight.w500,
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Bütün fəaliyyətlərinizi idarə etmək üçün məlumatlarınızı daxil edin",
            style: StyleUtils.bodyRegular(context)!,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

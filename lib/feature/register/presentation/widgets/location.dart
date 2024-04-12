import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tenderyard/common/constants.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: -2,
                blurRadius: 4,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: SvgPicture.asset(
            Assets.pin,
          ),
        ),
        Positioned(
          top: 6.h,
          child: Image.asset(
            Assets.map,
            fit: BoxFit.cover,
            height: 25,
            width: 33,
          ),
        ),
        Positioned(
          top: 8.h,
          child: SvgPicture.asset(Assets.location),
        ),
      ],
    );;
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingHeading extends StatelessWidget {
  const OnBoardingHeading({
    super.key,
    required this.title,
    required this.subtitle,
    required this.lowerTitle,
  });

  final String title;
  final String subtitle;
  final String lowerTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xff2E2E2D)),
        ),
        Text(
          subtitle,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40.sp,
              height: 1.2,
              color: const Color(0xff2E2E2D)),
        ),
        Text(
          lowerTitle,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40.sp,
              height: 1,
              color: const Color(0xffE6740C)),
        ),
      ],
    );
  }
}

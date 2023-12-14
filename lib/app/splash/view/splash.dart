import 'dart:async';

import 'package:chargemod_assign/app/onboarding/view/onboarding.dart';
import 'package:chargemod_assign/routes/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  double _progress = 0.0;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 40), (timer) {
      setState(() {
        _progress += 0.01;
        if (_progress > 1.0) {
          _timer.cancel();
          moveTo(context, const OnBoardingView());
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 40,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 226.w,
                        height: 6.h,
                        child: LinearProgressIndicator(
                          value: _progress,
                          minHeight: 6.h,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xffE6740C)),
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        'Connecting to chargeMOD',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff666766),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}

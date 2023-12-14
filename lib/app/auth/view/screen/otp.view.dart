import 'dart:async';

import 'package:chargemod_assign/app/auth/bloc/auth_bloc.dart';
import 'package:chargemod_assign/app/home/bloc/home_bloc.dart';
import 'package:chargemod_assign/app/navigation_bar/view/navigation.dart';
import 'package:chargemod_assign/app/profile/bloc/profile_bloc.dart';
import 'package:chargemod_assign/app/profile/view/update_profile.dart';
import 'package:chargemod_assign/routes/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPView extends StatefulWidget {
  const OTPView({super.key, required this.phone});
  final String phone;

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final otpController = TextEditingController();

  int _secondsRemaining = 120;
  late Timer _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _secondsRemaining = 120;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_secondsRemaining == 0) {
          _timer.cancel();
        } else {
          _secondsRemaining--;
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
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 31.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  Text(
                    "Verification",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    width: 20,
                  ),
                ],
              ),
            ),
            SizedBox(height: 43.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Text(
                "We’ve send you the verification code on +91 ${widget.phone}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xff2E2E2D),
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 19.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 65.w),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 55,
                  fieldWidth: 55,
                  activeFillColor: Colors.white,
                  activeBorderWidth: 1,
                  selectedBorderWidth: 1,
                  inactiveBorderWidth: 1,
                  inactiveColor: const Color(0xffE4DFDF),
                  selectedColor: const Color(0xff534B4A),
                  activeColor: const Color(0xffE4DFDF),
                ),
                animationDuration: const Duration(milliseconds: 300),

                // errorAnimationController: errorController,
                controller: otpController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            _secondsRemaining == 0
                ? GestureDetector(
                    onTap: () {
                      context
                          .read<AuthBloc>()
                          .add(ReSendOTPEvent(phone: widget.phone));
                      _startTimer();
                    },
                    child: Text(
                      "Resent OTP",
                      style: TextStyle(
                        color: const Color(0xffE6740C),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                : Text(
                    "Re-send code in ${(_secondsRemaining / 60).floor()}:${_secondsRemaining % 60.floor()}",
                    style: TextStyle(
                      color: const Color(0xffE6740C),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                    )),
            const Spacer(),
            BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is ProfileLoaded) {
                  moveRemoveUntil(context, const NavigationView());
                }
              },
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is Authenticated) {
                    context.read<HomeBloc>().add(LoadLocationEvent());
                    if (GetStorage().read('firstTime') == true) {
                      moveRemoveUntil(
                          context, UpdateProfileView(phone: widget.phone));
                    } else {
                      context.read<ProfileBloc>().add(ProfileLoadEvent());
                    }
                  }
                  if (state is AuthError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }

                  if (state is OTPReSentState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('OTP is resent')));
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (state is! AuthLoading) {
                        if (otpController.text.trim().isEmpty &&
                            otpController.text.trim().length < 4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Enter Valid OTP")));
                        } else {
                          context.read<AuthBloc>().add(VerifyOTPEvent(
                              otp: otpController.text.trim(),
                              phone: widget.phone));
                        }
                      }
                    },
                    child: Container(
                      width: 1.sw,
                      height: 43.h,
                      margin: EdgeInsets.symmetric(horizontal: 51.w)
                          .copyWith(bottom: 50.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.h),
                        color: const Color(0xffE6740C),
                      ),
                      child: Center(
                        child: state is AuthLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                "CONTINUE",
                                style: TextStyle(
                                    letterSpacing: 0.8,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:chargemod_assign/app/auth/bloc/auth_bloc.dart';
import 'package:chargemod_assign/app/auth/view/screen/otp.view.dart';
import 'package:chargemod_assign/routes/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 83.h),
              Column(
                children: [
                  Text(
                    "ChargeMOD",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: const Color(0xff2E2E2D)),
                  ),
                  Text(
                    "Let’s Start",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.sp,
                        height: 1.2,
                        color: const Color(0xff2E2E2D)),
                  ),
                  Text(
                    "From Login",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 40.sp,
                        height: 1,
                        color: const Color(0xffE6740C)),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 34.w),
                child: Row(
                  children: [
                    Container(
                      width: 63.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xffE4DFDF))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 8.w),
                          SvgPicture.asset("assets/india.svg"),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                    ),
                    SizedBox(width: 7.w),
                    Expanded(
                        child: Container(
                      height: 36.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: const Color(0xffE4DFDF))),
                      child: Center(
                        child: TextFormField(
                          controller: phoneController,
                          // validator: (text) {
                          //   if (text!.isNotEmpty && text.length < 10) {
                          //     return 'Enter valid phone';
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLength: 10,

                          style: TextStyle(fontSize: 14.sp),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter phone number",
                              hintStyle: TextStyle(
                                color: const Color(0xff534B4A),
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                              ),
                              counterText: "",
                              prefixIcon: const Icon(Icons.phone)),
                        ),
                      ),
                    ))
                    // Expanded(
                    //   child: TextFormField(
                    //     controller: phoneController
                    //       ..addListener(() {
                    //         // final emailValid = RegExp(
                    //         //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    //         //     .hasMatch(emailController.text);
                    //         // if (emailController.text.isNotEmpty) {
                    //         //   if (!emailValid) {
                    //         //     setState(() {
                    //         //       validEmail = false;
                    //         //     });
                    //         //   } else {
                    //         //     setState(() {
                    //         //       validEmail = true;
                    //         //     });
                    //         //   }
                    //         // }
                    //       }),
                    //     autovalidateMode: AutovalidateMode.always,
                    //     validator: (text) {
                    //       // if (text != null) {
                    //       //   if (text.length < 10) {
                    //       //     return 'Mobile Number must be of 10digit';
                    //       //   } else if (text.length > 10) {
                    //       //     return 'Mobile Number cannot be of more than 10 digit';
                    //       //   } else {
                    //       //     return null;
                    //       //   }
                    //       // } else {
                    //       //   return null;
                    //       // }
                    //     },
                    //     keyboardType: TextInputType.phone,
                    //     textAlignVertical: TextAlignVertical.center,
                    //     decoration: InputDecoration(
                    //         prefixIcon: const Icon(Icons.local_phone_outlined),
                    //         hintText: "Enter phone number",
                    //         hintStyle: const TextStyle(
                    //           color: Color(0xff534B4A),
                    //         ),
                    //         border: OutlineInputBorder(
                    //           borderSide:
                    //               const BorderSide(color: Color(0xffEAEAEA)),
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         contentPadding: EdgeInsets.zero),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 11.h),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is OTPSentState) {
                    moveTo(
                        context, OTPView(phone: phoneController.text.trim()));
                  }
                  if (state is AuthError) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (state is! AuthLoading) {
                        if (_formKey.currentState!.validate()) {
                          if (phoneController.text.trim().length == 10) {
                            context.read<AuthBloc>().add(SendOTPEvent(
                                phone: phoneController.text.trim()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Enter Valid Phone Number")));
                          }
                        }
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 34.w),
                      width: 1.sw,
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffE6740C),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: state is AuthLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                "Send OTP",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Column(
                  children: [
                    Text(
                      "By Continuing you agree to our",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff2E2E2D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text.rich(
                      const TextSpan(
                        children: [
                          TextSpan(
                            text: "Terms & Condition ",
                            style: TextStyle(color: Color(0xffE6740C)),
                          ),
                          TextSpan(text: "and "),
                          TextSpan(
                            text: "Privacy Policy",
                            style: TextStyle(color: Color(0xffE6740C)),
                          )
                        ],
                      ),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff2E2E2D),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 52.h),
            ],
          ),
        ),
      ),
    );
  }
}

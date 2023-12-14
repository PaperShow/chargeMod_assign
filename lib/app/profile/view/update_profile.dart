import 'package:chargemod_assign/app/profile/bloc/profile_bloc.dart';
import 'package:chargemod_assign/app/profile/view/profile.view.dart';
import 'package:chargemod_assign/routes/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key, required this.phone});

  final String phone;

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Update Profile',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UpdateElement(
                        title: "First Name",
                        textType: TextInputType.name,
                        controller: firstNameController,
                      ),
                      UpdateElement(
                        title: "Last Name",
                        textType: TextInputType.name,
                        controller: lastNameController,
                      ),
                      UpdateElement(
                        title: "Email",
                        textType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        widget.phone,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Completing Your Profile",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "This action will reflect in your activities and payments after saving. we ask for email details for recieving monthly activity and notifications.",
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (context, state) {
                      if (state is ProfileLoaded) {
                        moveTo(context, ProfileView());
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(emailController.text.trim());
                          if (emailValid) {
                            context.read<ProfileBloc>().add(
                                  ProfileUpdateEvent(
                                      phone: widget.phone,
                                      first: firstNameController.text.trim(),
                                      last: lastNameController.text.trim(),
                                      email: emailController.text.trim()),
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Invalid Email Address")));
                          }
                        },
                        child: Container(
                          height: 38.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                              color: const Color(0xffE6740C),
                              borderRadius: BorderRadius.circular(7)),
                          child: Center(
                            child: state is ProfileLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    "Save Changes",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 34.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateElement extends StatelessWidget {
  const UpdateElement({
    super.key,
    required this.title,
    required this.textType,
    required this.controller,
  });

  final String title;
  final TextInputType textType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 6.h),
          Container(
            height: 41.h,
            width: 1.sw,
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                // border: Border.all(),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x00000059).withOpacity(0.35),
                    blurRadius: 4,
                    spreadRadius: 0,
                  )
                ]),
            child: TextField(
              controller: controller,
              // keyboardType: textType,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: title,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

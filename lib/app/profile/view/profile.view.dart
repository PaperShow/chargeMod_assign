import 'package:chargemod_assign/app/auth/bloc/auth_bloc.dart';
import 'package:chargemod_assign/app/profile/bloc/profile_bloc.dart';
import 'package:chargemod_assign/app/profile/model/profiletile.dart';
import 'package:chargemod_assign/app/profile/view/widgets/profile_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  final List<ProfileTileModel> list1 = [
    ProfileTileModel(title: "My Payments", icon: "assets/profile/payment.svg"),
    ProfileTileModel(
        title: "My Electric Vehicles", icon: "assets/profile/vehicle.svg"),
    ProfileTileModel(
        title: "My Favourite Stations", icon: "assets/profile/favourite.svg"),
    ProfileTileModel(
        title: "Alpha membership", icon: "assets/profile/alpha.svg"),
  ];
  final List<ProfileTileModel> list2 = [
    ProfileTileModel(title: "My Devices", icon: "assets/profile/device.svg"),
    ProfileTileModel(title: "My Orders", icon: "assets/profile/orders.svg"),
  ];

  final List<ProfileTileModel> list3 = [
    ProfileTileModel(title: "Help", icon: "assets/profile/help.svg"),
    ProfileTileModel(
        title: "Raise Complaints", icon: "assets/profile/complaint.svg"),
    ProfileTileModel(title: "About Us", icon: "assets/profile/about.svg"),
    ProfileTileModel(
        title: "Privacy Policy", icon: "assets/profile/policy.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProfileLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: Column(
                    children: [
                      SizedBox(height: 26.h),
                      Text(
                        'Hello',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff666766)),
                      ),
                      Text(
                        "${state.user.data!.user!.first.firstName} ${state.user.data!.user!.first.lastName}",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 26.h),
                      Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/profile_bg.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 232, 232, 232),
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              spreadRadius: 3,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 21.w)
                              .copyWith(top: 16.h, bottom: 19.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Energy Balance",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xff666766)),
                                      ),
                                      Text(
                                        "99999 kWH",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "Added 100 kWH on 20/11/2022",
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color(0xff666766)),
                                      )
                                    ],
                                  ),
                                  SizedBox(width: 20.w),
                                  Image.asset("assets/badge.png"),
                                ],
                              ),
                              SizedBox(height: 14.h),
                              SizedBox(
                                height: 26.h,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 3.h),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff4EAD2B),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "Add Energy",
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 24.w),
                                    Expanded(
                                      child: Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 3.h),
                                        decoration: BoxDecoration(
                                          border: Border.all(),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.monetization_on,
                                              color: Color(0xffE9852A),
                                            ),
                                            Text(
                                              "55 points",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      ProfileSettingList(list: list1),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 24.h),
                        height: 38.h,
                        width: 1.sw,
                        decoration: BoxDecoration(
                          color: const Color(0xffE6740C),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Buy Machines From chargeMOD",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      ProfileSettingList(list: list2),
                      SizedBox(height: 24.h),
                      ProfileSettingList(list: list3),
                      GestureDetector(
                        onTap: () {
                          context.read<AuthBloc>().add(LogOutEvent());
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 24.h),
                          height: 38.h,
                          width: 1.sw,
                          decoration: BoxDecoration(
                            color: const Color(0xffE6740C),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 45.h),
                      SvgPicture.asset("assets/profile/footer.svg"),
                      SizedBox(height: 25.h),
                      Text(
                        "V 1.0.0 (001)",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff666766),
                        ),
                      ),
                      Text(
                        "Copyright © 2022 BPM Power Pvt Ltd.",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff666766),
                        ),
                      ),
                      Text(
                        "All rights reserved.",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff666766),
                        ),
                      ),
                      SizedBox(height: 25.h),
                    ],
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

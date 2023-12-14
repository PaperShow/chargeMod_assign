import 'package:chargemod_assign/app/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: 1.sh,
              width: 1.sw,
              child: Image.asset(
                "assets/map.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 18.h,
              width: 1.sw,
              child: BlocConsumer<HomeBloc, HomeState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LocationLoaded) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            state.location.data!.result!.length, (index) {
                          var result = state.location.data!.result![index];
                          var address =
                              "${result.street1} ${result.street2} ${result.city} ${result.state}";
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 10.w,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result.name.toString(),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  address,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: const Color(0xff534B4A),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

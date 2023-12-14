import 'package:chargemod_assign/app/auth/view/screen/login.view.dart';
import 'package:chargemod_assign/routes/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  List<OnBoardingHeading> heading = const [
    OnBoardingHeading(
      title: 'Charge your EV',
      subtitle: 'At Your',
      lowerTitle: 'FingerTips',
    ),
    OnBoardingHeading(
      title: 'Easy EV Navigation',
      subtitle: 'Travel Route',
      lowerTitle: 'For Electrics',
    ),
    OnBoardingHeading(
        title: 'Interaction with Grid',
        subtitle: 'RealTime',
        lowerTitle: 'Monitoring'),
  ];
  List<String> pageSummary = [
    "Scan Charge and Go Effortless Charging schemas",
    "Grab The Best In Class Digital Experience Crafted For EV Drivers",
    "Intelligent Sensible Devices Ambicharge Series"
  ];
  bool first = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset("assets/background.png"),
            Column(
              children: [
                SizedBox(height: 160.h),
                Expanded(
                  child: PageView.builder(
                    controller: _controller
                      ..addListener(() {
                        if (_controller.page != 0) {
                          setState(() {
                            first = false;
                          });
                        } else {
                          setState(() {
                            first = true;
                          });
                        }
                      }),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          heading[index],
                          SizedBox(height: 16.h),
                          if (index == 0)
                            SizedBox(
                              height: 230.h,
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 19.w,
                                    child: Image.asset(
                                      'assets/scooty.png',
                                      fit: BoxFit.cover,
                                      height: 230.h,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else if (index == 1)
                            SizedBox(
                                height: 220.h,
                                child: Image.asset(
                                  "assets/route.png",
                                ))
                          else
                            SizedBox(
                                height: 230.h,
                                child: Image.asset(
                                  "assets/monitor.png",
                                )),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 60.w)
                                .copyWith(top: 40.h),
                            child: Text(
                              pageSummary[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48.w)
                      .copyWith(bottom: 32.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      first
                          ? SizedBox(
                              height: 52.h,
                              width: 52.h,
                            )
                          : GestureDetector(
                              onTap: () {
                                _controller.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease);
                              },
                              child: Container(
                                height: 52.h,
                                width: 52.h,
                                decoration: const BoxDecoration(
                                    color: Color(0xffE6740C),
                                    shape: BoxShape.circle),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const WormEffect(
                          dotHeight: 12,
                          dotWidth: 12,
                          spacing: 15,
                          activeDotColor: Color(0xff2E2E2D),
                          dotColor: Color(0xff666766),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease);
                          if (_controller.page == 2) {
                            moveTo(context, const LoginView());
                          }
                        },
                        child: Container(
                          height: 52.h,
                          width: 52.h,
                          decoration: const BoxDecoration(
                              color: Color(0xffE6740C), shape: BoxShape.circle),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 21.h,
              right: 30.w,
              child: GestureDetector(
                onTap: () {
                  moveTo(context, const LoginView());
                },
                child: const Text(
                  "SKIP",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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

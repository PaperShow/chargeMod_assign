import 'package:chargemod_assign/app/activity/activity.dart';
import 'package:chargemod_assign/app/auth/bloc/auth_bloc.dart';
import 'package:chargemod_assign/app/auth/view/screen/login.view.dart';
import 'package:chargemod_assign/app/community/community.dart';
import 'package:chargemod_assign/app/home/view/home.dart';
import 'package:chargemod_assign/app/navigation_bar/bloc/navigation_bloc.dart';
import 'package:chargemod_assign/app/profile/view/profile.view.dart';
import 'package:chargemod_assign/routes/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<BottomNavigationBarItem> bottomNavItems = [
  BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/navigation/home.svg"), label: 'Home'),
  BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/navigation/activity.svg"),
      label: 'Explore'),
  BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/navigation/community.svg"), label: 'Post'),
  BottomNavigationBarItem(
      icon: SvgPicture.asset("assets/navigation/profile.svg"),
      label: 'Profile'),
];

List<Widget> pages = [
  const HomeView(),
  const ActivityView(),
  const CommunityView(),
  ProfileView(),
];

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          moveRemoveUntil(context, const LoginView());
        }
      },
      child: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Center(child: pages.elementAt(state.tabIndex)),
            bottomNavigationBar: BottomNavigationBar(
              items: bottomNavItems,
              currentIndex: state.tabIndex,
              unselectedItemColor: const Color.fromARGB(255, 167, 162, 162),
              selectedItemColor: Colors.blue,
              onTap: (index) {
                BlocProvider.of<NavigationBloc>(context)
                    .add(TabChangeEvent(tabIndex: index));
              },
              selectedLabelStyle: TextStyle(
                fontSize: 8.sp,
                color: const Color(0xff666766),
              ),
            ),
          );
        },
      ),
    );
  }
}

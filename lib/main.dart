import 'package:chargemod_assign/app/auth/bloc/auth_bloc.dart';
import 'package:chargemod_assign/app/auth/repo/auth_repo.dart';
import 'package:chargemod_assign/app/home/bloc/home_bloc.dart';
import 'package:chargemod_assign/app/home/repo/location_repo.dart';
import 'package:chargemod_assign/app/navigation_bar/bloc/navigation_bloc.dart';
import 'package:chargemod_assign/app/profile/bloc/profile_bloc.dart';
import 'package:chargemod_assign/app/profile/repo/profile.repo.dart';
import 'package:chargemod_assign/app/splash/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider(
          create: (context) => ProfileRepository(),
        ),
        RepositoryProvider(
          create: (context) => LocationRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBloc()),
          BlocProvider(
            create: (context) => AuthBloc(
              RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => ProfileBloc(
              RepositoryProvider.of<ProfileRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => HomeBloc(
              RepositoryProvider.of<LocationRepository>(context),
            ),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(363, 755),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const SplashView(),
              );
            }),
      ),
    );
  }
}

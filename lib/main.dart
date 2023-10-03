import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/app_colors.dart';
import 'package:news_app/data/cubit/bloc_oobserv.dart';
import 'package:news_app/data/cubit/cubit.dart';
import 'package:news_app/data/requests/api.dart';

import 'pressention/screens/home_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ApiSerivecs.intial();

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => NewsCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        textTheme:TextTheme(labelMedium: TextStyle(fontSize: 20)),
          primaryColor: AppColor.botomNavColor,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: AppColor.grey,
            backgroundColor: AppColor.scaffoldColor,
              elevation: 20, selectedItemColor: AppColor.botomNavColor),
          scaffoldBackgroundColor: AppColor.scaffoldColor,
          
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColor.scaffoldColor,
              elevation: 0,
              titleTextStyle: TextStyle(
                  color: AppColor.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
              iconTheme: IconThemeData(
                color: AppColor.white,
              ))),
      theme: ThemeData(
                textTheme:TextTheme(labelMedium: TextStyle(fontSize: 20)),

        primaryColor: AppColor.botomNavColor,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            elevation: 20, selectedItemColor: AppColor.botomNavColor),
        scaffoldBackgroundColor: AppColor.white,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.white,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: AppColor.black,
                fontSize: 20,
                fontWeight: FontWeight.w700),
            iconTheme: IconThemeData(
              color: AppColor.black,
            )),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/cubit/state.dart';
import 'package:news_app/data/requests/api.dart';
import 'package:news_app/pressention/screens/bottom_nav_bar_screen/bussines.dart';
import 'package:news_app/pressention/screens/bottom_nav_bar_screen/science.dart';
import 'package:news_app/pressention/screens/bottom_nav_bar_screen/sport.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(InailStateNews());
  static NewsCubit get(context) => BlocProvider.of(context);
  int curenIndex = 0;
  List<Widget> screens = [const Bussines(), const Sport(), const Science()];
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_rounded),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports_rounded),
      label: 'Sport',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science_rounded),
      label: 'Science',
    ),
  ];
  void changeBottomNav(int index) {
    curenIndex = index;
    emit(ChangeNavBottom());
  }

  dynamic newsData = [];

   void getBusinesData() {
    emit(LoadingBusinessState());
    ApiSerivecs.getData(path: 'v2/top-headlines', que: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'ab061c22234f4d74a8e2e3ec35cbfa36'
    }).then((value) {
      newsData = value.data['articles'];
      log(newsData['title'].toString(),name: 'title');
      log(newsData['publishedAt'].toString(),name: 'date');
      emit(SuccessBusinessState());
    }).catchError((error) {
      emit(ErorrBusinessState(error.toString()));
      log(error.toString(),name: 'erorr');
    });
  }
}

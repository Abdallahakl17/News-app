import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/app_word.dart';
import 'package:news_app/data/cubit/cubit.dart';
import 'package:news_app/data/cubit/state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinesData(),
      child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            NewsCubit newsCubit = NewsCubit.get(context);
            return Scaffold(
            appBar: AppBar(
                title: const Text(AppWord.newsApp),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.dark_mode)),
                ],
              ),
              body: newsCubit.screens[newsCubit.curenIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: newsCubit.curenIndex,
                items: newsCubit.bottomItems,
                onTap: (value) {
                  newsCubit.changeBottomNav(value);
                },
              ),
            );
          }),
    );
  }
}

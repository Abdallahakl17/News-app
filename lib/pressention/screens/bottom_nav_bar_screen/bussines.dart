import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/cubit/cubit.dart';
import 'package:news_app/data/cubit/state.dart';
import 'package:news_app/pressention/widgets/divider.dart';
import 'package:news_app/pressention/widgets/items_veiw.dart';

class Bussines extends StatelessWidget {
  const Bussines({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var newsCubit = NewsCubit.get(context);
        return ConditionalBuilder(
            condition: state is! LoadingBusinessState,
            builder: (context) => ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildItems(newsCubit.newsData[index]);
                },
                separatorBuilder: (context, index) {
                  return dividerItem();
                },
                itemCount: newsCubit.newsData.length),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()));
      },
    );
  }
}

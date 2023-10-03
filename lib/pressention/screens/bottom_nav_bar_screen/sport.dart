import 'package:flutter/material.dart';
import 'package:news_app/app/app_word.dart';

class Sport extends StatelessWidget {
  const Sport({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      AppWord.sport,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    ));
  }
}

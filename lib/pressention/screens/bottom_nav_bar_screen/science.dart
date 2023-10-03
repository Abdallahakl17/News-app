import 'package:flutter/material.dart';
import 'package:news_app/app/app_word.dart';

class Science extends StatelessWidget {
  const Science({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      AppWord.science,
      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
    ));
  }
}

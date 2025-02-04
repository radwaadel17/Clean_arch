import 'package:bookly_app/core/utlis/styles.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/SearchListView.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/SearchTextField.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextField(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Text(
            'Search results',
            style: Styles.textstyle18,
          ),
        ),
        SearchListView(),
      ],
    );
  }
}

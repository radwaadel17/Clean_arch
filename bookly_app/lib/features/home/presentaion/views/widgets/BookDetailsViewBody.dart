import 'package:bookly_app/core/utlis/styles.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/BooksAction.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/CustomAppBarForBookDetailsView%20.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/CustomBookImage.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/ListViewOfBookDeatilsView%20.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/RatingRow.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const CustomAppBarForBookDetailsView(),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.34,
                  child: const CustomBookImage()),
              const SizedBox(height: 43),
              const Text(
                'The Jungle Book',
                style: Styles.textstyle30,
              ),
              Text(
                'Rudyard Kipling',
                style: Styles.textstyle18.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.normal,
                    color: Colors.white.withOpacity(0.7)),
              ),
              const SizedBox(
                height: 14,
              ),
              const RatingRow(),
              const SizedBox(
                height: 37,
              ),
              const BooksAction(),
              const Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You may like ',
                    style: Styles.textstyle16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const ListViewOfBookDeatilsView(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}

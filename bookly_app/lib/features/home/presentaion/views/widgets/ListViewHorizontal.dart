import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentaion/manager/fetch_best_seller_cubit/fetch_best_seller_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/CustomBookImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  late ScrollController _scrollController;
  var pagenumber = 1 ;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.7) {
        BlocProvider.of<FetchBestSellerCubit>(context).fetchBestSellerMethod(pagenumber: pagenumber++);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return CustomBookImage(url: widget.books[index].image);
          },
        ),
      ),
    );
  }
}

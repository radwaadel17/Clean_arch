import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/presentaion/manager/fetch_best_seller_cubit/fetch_best_seller_cubit.dart';
import 'package:bookly_app/features/home/presentaion/manager/fetch_best_seller_cubit/fetch_best_seller_states.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/ListViewHorizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewHoricontalBlocBuilder extends StatefulWidget {
  const ListViewHoricontalBlocBuilder({
    super.key,
  });

  @override
  State<ListViewHoricontalBlocBuilder> createState() =>
      _ListViewHoricontalBlocBuilderState();
}

class _ListViewHoricontalBlocBuilderState
    extends State<ListViewHoricontalBlocBuilder> {
  List<BookEntity> booksItmes = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchBestSellerCubit, FetchBestSellerStates>(
      listener: (context, state) {
        if (state is FetchBestSellerStatesSucsess) {
          booksItmes.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FetchBestSellerStatesSucsess ||
            state is FetchBestSellerStatesPaginationLoading
            || state is FetchBestSellerStatesFaluire) {
          return ListViewHorizontal(books: booksItmes);
        } else if (state is FetchBestSellerStatesFaluire) {
          return Text(state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

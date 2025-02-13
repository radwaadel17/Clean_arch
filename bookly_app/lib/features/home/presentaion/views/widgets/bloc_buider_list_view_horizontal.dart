import 'package:bookly_app/features/home/presentaion/manager/fetch_best_seller_cubit/fetch_best_seller_cubit.dart';
import 'package:bookly_app/features/home/presentaion/manager/fetch_best_seller_cubit/fetch_best_seller_states.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/ListViewHorizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewHoricontalBlocBuilder extends StatelessWidget {
  const ListViewHoricontalBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBestSellerCubit, FetchBestSellerStates>(
      builder: (context, state) {
        if(state is FetchBestSellerStatesSucsess){
          return ListViewHorizontal(books: state.books,);
        }
        else if (state is FetchBestSellerStatesFaluire){
          return Text(state.errorMessage);
        }
        else {
          return const  CircularProgressIndicator();
        }
      },
    );
  }
}

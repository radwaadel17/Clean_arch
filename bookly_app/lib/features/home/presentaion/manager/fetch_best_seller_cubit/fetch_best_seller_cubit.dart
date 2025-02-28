import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentaion/manager/fetch_best_seller_cubit/fetch_best_seller_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchBestSellerCubit extends Cubit<FetchBestSellerStates> {
  FetchBestSellerCubit(this.homeRepo) : super(FetchBestSellerStatesInit());

  final HomeRepo homeRepo;

  Future<void> fetchBestSellerMethod({int pagenumber = 0}) async {
    if (pagenumber == 0) {
      emit(FetchBestSellerStatesLoading());
    } else {
      emit(FetchBestSellerStatesPaginationLoading());
    }
    var result = await homeRepo.fetchFeaturedBooks(pagenumber: pagenumber);
    result.fold((faluire) {
      if(pagenumber == 0){
       emit(FetchBestSellerStatesFaluire(faluire.errorMessage));
      }
      else {
        emit(FetchBestSellerStatesFaluire(faluire.errorMessage));
      }
      
    }, (books) {
      emit(FetchBestSellerStatesSucsess(books));
    });
  }
}

import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/features/home/presentaion/manager/fetch_newest_books_cubit/fetch_newest_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchNewestCubit extends Cubit<FetchNewestStates> {
  FetchNewestCubit(this.homeRepo) : super(FetchNewestStatesInit());

  final HomeRepo homeRepo;

  Future<void> fetchBestSellerMethod() async {
    emit(FetchNewestStatesLoading());
    var result = await homeRepo.fetchNewestBooks();
    result.fold((faluire) {
      emit(FetchNewestStatesFaluire(faluire.errorMessage));
    }, (books) {
      emit(FetchNewestStatesSucsess());
    });
  }
}

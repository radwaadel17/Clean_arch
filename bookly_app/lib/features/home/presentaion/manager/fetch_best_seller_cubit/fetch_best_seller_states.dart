import 'package:bookly_app/features/home/domain/entites/book_entity.dart';

class FetchBestSellerStates {}

class FetchBestSellerStatesInit extends FetchBestSellerStates {}
class FetchBestSellerStatesPaginationLoading extends FetchBestSellerStates {}


class FetchBestSellerStatesFaluire extends FetchBestSellerStates {
  final String errorMessage;
  FetchBestSellerStatesFaluire(this.errorMessage);
}

class FetchBestSellerStatesSucsess extends FetchBestSellerStates {
  List<BookEntity> books;
  FetchBestSellerStatesSucsess(this.books);
}

class FetchBestSellerStatesLoading extends FetchBestSellerStates {}

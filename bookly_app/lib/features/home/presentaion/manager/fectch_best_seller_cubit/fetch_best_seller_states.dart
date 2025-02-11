class FetchBestSellerStates {}

class FetchBestSellerStatesInit extends FetchBestSellerStates {}

class FetchBestSellerStatesFaluire extends FetchBestSellerStates {
  final String errorMessage;
  FetchBestSellerStatesFaluire(this.errorMessage);
}

class FetchBestSellerStatesSucsess extends FetchBestSellerStates {}

class FetchBestSellerStatesLoading extends FetchBestSellerStates {}

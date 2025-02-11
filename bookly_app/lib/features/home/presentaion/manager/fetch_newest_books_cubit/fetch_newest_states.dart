class FetchNewestStates {}

class FetchNewestStatesInit extends FetchNewestStates {}

class FetchNewestStatesFaluire extends FetchNewestStates {
  final String errorMessage;
  FetchNewestStatesFaluire(this.errorMessage);
}

class FetchNewestStatesSucsess extends FetchNewestStates {}

class FetchNewestStatesLoading extends FetchNewestStates {}

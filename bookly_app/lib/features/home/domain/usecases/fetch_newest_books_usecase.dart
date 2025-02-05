import 'package:bookly_app/core/errors/faluire.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:bookly_app/features/home/domain/usecases/fetch_featured_books_usecase.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUsecase implements UseCase<List<BookEntity>, NoParam> {
  HomeRepo homeRepo;
  FetchNewestBooksUsecase(this.homeRepo);

  @override
  Future<Either<Faluire, List<BookEntity>>> call(NoParam? param) {
    return homeRepo.fetchNewestBooks();
  }
}

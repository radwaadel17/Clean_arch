import 'package:bookly_app/core/errors/faluire.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUsecase implements UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;
  FetchFeaturedBooksUsecase(this.homeRepo);

  @override
  Future<Either<Faluire, List<BookEntity>>> call(NoParam? param) {
    // say check premission
    return homeRepo.fetchFeaturedBooks();
  }
}

abstract class UseCase<Type, Param> {
  Future<Either<Faluire, Type>> call(Param param);
}

class NoParam {}

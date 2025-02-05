import 'package:bookly_app/core/errors/faluire.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faluire, List<BookEntity>>> fetchFeaturedBooks();
  Future<Either<Faluire, List<BookEntity>>> fetchNewestBooks();
}

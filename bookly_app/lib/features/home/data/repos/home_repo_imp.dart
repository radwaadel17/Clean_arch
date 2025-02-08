import 'package:bookly_app/core/errors/faluire.dart';
import 'package:bookly_app/features/home/data/data%20sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data%20sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  HomeRemoteDataSourceImp homeRemoteDataSource;
  HomeLocalDataSourceImp homeLocalDataSource;
  HomeRepoImp(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});
  @override
  Future<Either<Faluire, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var booksLocal = homeLocalDataSource.fetchFeaturedBooks();
      if (booksLocal.isNotEmpty) {
        return right(booksLocal);
      }
      var books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } on DioException catch (e) {
      return Left(Faluire());
    }
  }

  @override
  Future<Either<Faluire, List<BookEntity>>> fetchNewestBooks() async {
    try {
      var booksLocal = homeLocalDataSource.fetchFeaturedBooks();
      if (booksLocal.isNotEmpty) {
        return right(booksLocal);
      }
      var books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } on DioException catch (e) {
      return Left(Faluire());
    }
  }
}

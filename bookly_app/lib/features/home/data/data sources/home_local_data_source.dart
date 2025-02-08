import 'package:bookly_app/core/utlis/constants.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
    List<BookEntity>fetchFeaturedBooks();
    List<BookEntity>fetchNewestBooks();
}

class HomeLocalDataSourceImp implements HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks() {
    var box = Hive.box<BookEntity>(kBoxNameF);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kBoxNameN);
    return box.values.toList();
  }
}
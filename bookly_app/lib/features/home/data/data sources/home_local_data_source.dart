import 'package:bookly_app/core/utlis/constants.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
    List<BookEntity>fetchFeaturedBooks({int pagenumber = 0});
    List<BookEntity>fetchNewestBooks();
}

class HomeLocalDataSourceImp implements HomeLocalDataSource{
  @override
  List<BookEntity> fetchFeaturedBooks({int pagenumber = 0}) {
    int startIndex = pagenumber * 10 ;
    int endIndex = (pagenumber + 1)  * 10 ;
    var box = Hive.box<BookEntity>(kBoxNameF);
    int len = box.values.length;
    if(startIndex >= len || endIndex > len){
      return[];
    }
    return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kBoxNameN);
    return box.values.toList();
  }
}
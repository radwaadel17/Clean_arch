import 'package:bookly_app/core/utlis/api_service.dart';
import 'package:bookly_app/core/utlis/constants.dart';
import 'package:bookly_app/features/home/data/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource{
   Future<List<BookEntity>>fetchFeaturedBooks();
   Future<List<BookEntity>> fetchNewestBooks();
}
class HomeRemoteDataSourceImp implements HomeRemoteDataSource{
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pagenumber = 0}) async {
    
    Map<String , dynamic > data = await ApiService(Dio()).getData('q=programming&startIndex=${pagenumber * 10}');
    List<dynamic> dataList = data['items'];
    List<BookEntity> books = [];
    for(int i = 0 ; i < dataList.length ; i++){
      books.add(BookModel.fromJson(dataList[i]));
    }
    var box = Hive.box<BookEntity>(kBoxNameF);
    box.addAll(books);
    return books;    
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async{
     Map<String , dynamic > data = await ApiService(Dio()).getData('q=programming&Sorting=newest');
    List<dynamic> dataList = data['items'];
    List<BookEntity> books = [];
    for(int i = 0 ; i < dataList.length ; i++){
      books.add(BookModel.fromJson(dataList[i]));
    }
    var box = Hive.box<BookEntity>(kBoxNameN);
    box.addAll(books);
    return books;    
  }

}
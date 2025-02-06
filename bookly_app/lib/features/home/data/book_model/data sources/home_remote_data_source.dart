import 'package:bookly_app/core/utlis/api_service.dart';
import 'package:bookly_app/features/home/data/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:dio/dio.dart';

abstract class HomeRemoteDataSource{
   Future<List<BookEntity>>fetchFeaturedBooks();
   Future<List<BookEntity>> fetchNewestBooks();
}
class HomeRemoteDataSourceImp implements HomeRemoteDataSource{
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    
    Map<String , dynamic > data = await ApiService(Dio()).getData('q=programming');
    List<dynamic> dataList = data['items'];
    List<BookEntity> books = [];
    for(int i = 0 ; i < dataList.length ; i++){
      books.add(BookModel.fromJson(dataList[i]));
    }
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
    return books;    
  }

}
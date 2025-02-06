import 'package:dio/dio.dart';

class ApiService {
  final Dio dio ;
  ApiService(this.dio);
  final baseUrl = 'https://www.googleapis.com/books/v1/volumes?';
  Future<Map<String , dynamic>> getData(String endPoint) async{
    Response response = await dio.get('$baseUrl$endPoint');
    Map<String , dynamic > responseData = response.data ;
    return responseData;
  }
}
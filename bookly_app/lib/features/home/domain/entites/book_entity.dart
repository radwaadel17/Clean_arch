import 'package:hive/hive.dart';


part 'book_entity.g.dart';
@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  final String? image;
  @HiveField(1)
  final String? title;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final num? price;
  @HiveField(4)
  final String? bookId;
  BookEntity(
      {required this.bookId,
      required this.author,
      required this.image,
      required this.price,
      required this.title});
}

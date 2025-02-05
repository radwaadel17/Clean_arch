class BookEntity {
  final String? image;
  final String? title;
  final String? author;
  final num? price;
  final String? bookId ;
  BookEntity(
      {
      required this.bookId,  
      required this.author,
      required this.image,
      required this.price,
      required this.title});
}

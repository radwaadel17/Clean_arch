import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utlis/approuter.dart';
import 'package:bookly_app/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox('BookEntity');
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Approuter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Scolor,
          brightness: Brightness.dark,
          fontFamily: 'Montserrat'),
    );
  }
}

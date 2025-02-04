import 'package:bookly_app/features/home/presentaion/views/widgets/BooksActionBody.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
              child: BooksActionBody(
            text: '19.99',
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            textColor: Colors.black,
            backgroundColor: Colors.white,
          )),
          Expanded(
              child: BooksActionBody(
            fontSize: 15,
            text: 'Free Preview',
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
            textColor: Colors.white,
            backgroundColor: Color.fromARGB(255, 255, 108, 108),
          )),
        ],
      ),
    );
  }
}

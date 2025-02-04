import 'package:bookly_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.solidStar,
            color: Colors.yellow,
            size: 14,
          ),
          SizedBox(
            width: 6.4,
          ),
          Text(
            '4.5',
            style: Styles.textstyle14,
          ),
          SizedBox(
            width: 6.4,
          ),
          Text(
            '(256898)',
            style: Styles.textstyle14,
          ),
        ],
      ),
    );
  }
}

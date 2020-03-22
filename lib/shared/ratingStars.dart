import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  RatingStars({Key key, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, size: 18, color: Colors.amber),
        Icon(Icons.star, size: 18, color: Colors.amber),
        Icon(Icons.star, size: 18, color: Colors.amber),
        Icon(Icons.star, size: 18, color: Colors.amber),
        Icon(Icons.star, size: 18, color: Colors.amber),
      ],
    );
  }
}

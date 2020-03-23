import 'package:flutter/material.dart';

class CircleProfile extends StatelessWidget {
  final String image;
  final double width;
  final double height;

  CircleProfile({this.image, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 2.0,
          color: Theme.of(context).accentColor,
        )
      ),
    );
  }
}

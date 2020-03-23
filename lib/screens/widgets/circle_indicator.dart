import 'package:flutter/material.dart';

class CircleIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: CircularProgressIndicator(),
    );
  }
}

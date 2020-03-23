import 'package:flutter/material.dart';
import 'package:flutterlol/models/champion.dart';
import 'package:flutterlol/screens/widgets/circle_profile.dart';

class TopChampionsWidget extends StatelessWidget {
  final List<Champion> champions;

  TopChampionsWidget({this.champions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile', arguments: champions[index]);
            },
            child: Hero(
              tag: champions[index].id,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CircleProfile(image: champions[index].image, width: 50, height: 50,),
              ),
            ),
          );
        },
        itemCount: champions.length,
      ),
    );
  }
}

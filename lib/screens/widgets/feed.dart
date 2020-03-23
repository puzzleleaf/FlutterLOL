import 'package:flutter/material.dart';
import 'package:flutterlol/models/champion.dart';
import 'package:flutterlol/screens/widgets/circle_profile.dart';
import 'package:provider/provider.dart';

import 'circle_indicator.dart';

class FeedWidget extends StatelessWidget {
  final Champion champion;

  FeedWidget({this.champion});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: champion,
      child: Consumer<Champion>(
        builder: (context, champion, child) {
          champion.updateSkins();

          return (champion.skins == null) ? CircleIndicator() : Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleProfile(image: champion.image, width: 35, height: 35,),
                    SizedBox(width: 8,),
                    Text(champion.name),
                    Expanded(child: Container(),),
                    Icon(Icons.more_horiz),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  height: 250,
                  child: PageView.builder(
                    itemCount: champion.skins.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                champion.skins[index].splashImage,
                                height: 250,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              color: Colors.black.withOpacity(0.5),
                              child: Text(champion.skins[index].name, style: TextStyle(color: Colors.white),),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(champion.blurb),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

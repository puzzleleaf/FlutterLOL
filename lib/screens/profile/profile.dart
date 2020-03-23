import 'package:flutter/material.dart';
import 'package:flutterlol/models/champion.dart';
import 'package:flutterlol/screens/profile/stats_text.dart';
import 'package:flutterlol/screens/widgets/circle_profile.dart';
import 'package:flutterlol/screens/widgets/feed.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Champion champion = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(champion.name),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Hero(
              tag: champion.id,
              child: CircleProfile(
                image: champion.image,
                width: 80,
                height: 80,
              ),
            ),
            SizedBox(height: 10,),
            Text(champion.name, style: TextStyle(fontSize: 15),),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StatsTextWidget(
                  title: 'HP',
                  value: champion.stats.hp,
                ),
                StatsTextWidget(
                  title: 'HPREGEN',
                  value: champion.stats.hpRegen,
                  titleSize: 12,
                ),
                StatsTextWidget(
                  title: 'MP',
                  value: champion.stats.mp,
                ),
                StatsTextWidget(
                  title: 'MPREGEN',
                  value: champion.stats.mpRegen,
                  titleSize: 12,
                ),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StatsTextWidget(
                  title: 'ATTACK',
                  value: champion.stats.attackDamage,
                  titleSize: 12,
                ),
                StatsTextWidget(
                  title: 'ATTACKSPEED',
                  value: champion.stats.attackSpeed,
                  titleSize: 12,
                ),
                StatsTextWidget(
                  title: 'ATTACKRANGE',
                  value: champion.stats.attackRange,
                  titleSize: 12,
                ),
              ],
            ),
            Divider(
              height: 30,
              color: Theme.of(context).accentColor,
              thickness: 1,
            ),
            SingleChildScrollView(
              child: FeedWidget(
                champion: champion,
              ),
            )
          ],
        ),
      ),
    );
  }
}

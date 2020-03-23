import 'package:flutter/material.dart';
import 'package:flutterlol/models/champion.dart';
import 'package:flutterlol/models/settings.dart';
import 'package:flutterlol/screens/home/top_champions.dart';
import 'package:flutterlol/screens/widgets/circle_indicator.dart';
import 'package:flutterlol/screens/widgets/feed.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Champion> champions = Provider.of<List<Champion>>(context);
    Settings settings = Provider.of<Settings>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.account_box),
              Text('League of Legends', style: TextStyle(fontSize: 15),),
              GestureDetector(
                onTap: () {
                  settings.themeToggle();
                },
                child: Icon(Icons.lightbulb_outline),
              ),
            ],
          ),
        ),
      ),
      body: (champions == null)
          ? Center(child: CircleIndicator())
          : Container(
              child: Column(
                children: <Widget>[
                  TopChampionsWidget(champions: champions),
                  SizedBox(height: 10,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          FeedWidget(champion: champions[0]),
                          FeedWidget(champion: champions[13]),
                          FeedWidget(champion: champions[22]),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ),
    );
  }
}

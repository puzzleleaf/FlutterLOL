import 'package:flutter/material.dart';
import 'package:flutterlol/models/champion.dart';
import 'package:flutterlol/models/settings.dart';
import 'package:flutterlol/screens/home/home.dart';
import 'package:flutterlol/screens/profile/profile.dart';
import 'package:flutterlol/services/lol_service.dart';
import 'package:flutterlol/utils/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final LOLService _lolService = LOLService();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Champion>>(
          create: (context) => _lolService.fetchChampions(),
        ),
        ChangeNotifierProvider<Settings>(
          create: (context) => Settings(),
        )
      ],
      child: Consumer<Settings>(
        builder: (context, settings, child) {
          return MaterialApp(
            title: 'Flutter LOL',
            theme: settings.themeData,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => HomeScreen(),
              '/profile': (context) => Profile()
            },
          );
        },
      ),
    );
  }
}
import 'dart:convert' as convert;
import 'package:flutterlol/models/champion.dart';
import 'package:http/http.dart' as http;

class LOLService {
  Future<List<Champion>> fetchChampions() async {
    var response = await http.get(
        'http://ddragon.leagueoflegends.com/cdn/10.5.1/data/en_US/champion.json');
    var jsonResponse = convert.jsonDecode(response.body);

    Map<String, dynamic> data = jsonResponse['data'];

    List<Champion> result = [];

    data.forEach((champion, data) {
      result.add(Champion.fromJson(data));
    });

    return result;
  }

  Future<List<ChampionSkin>> fetchChampionSkins(String id) async {

    var response = await http.get(
        'http://ddragon.leagueoflegends.com/cdn/10.6.1/data/en_US/champion/$id.json');
    var jsonResponse = convert.jsonDecode(response.body);

    var data = jsonResponse['data'][id];
    List<dynamic> skins = data['skins'];

    return skins.map((skin) {
      skin['champion'] = id;
      return ChampionSkin.fromJson(skin);
    }).toList();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutterlol/services/lol_service.dart';
import 'package:flutterlol/utils/constants.dart';

class Champion extends ChangeNotifier {

  final LOLService _lolService = LOLService();

  final String id;
  final String name;
  final String title;
  final String blurb;
  final String image;
  final ChampionStats stats;
  List<ChampionSkin> skins;

  Champion(
      {this.id, this.name, this.title, this.blurb, this.image, this.stats});

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      blurb: json['blurb'],
      image: '${Constants.BaseChampionImagePath}${json['image']['full'] ?? ''}',
      stats: ChampionStats.formJson(json['stats']),
    );
  }

  void updateSkins() async {
    if (skins == null) {
      skins = await _lolService.fetchChampionSkins(id);
      notifyListeners();
    }
  }

}

class ChampionSkin {
  final String champion;
  final String id;
  final String name;
  final int num;
  final String splashImage;
  final String loadingImage;

  ChampionSkin({this.champion, this.id, this.name, this.num, this.splashImage, this.loadingImage});

  factory ChampionSkin.fromJson(Map<String, dynamic> json) {
    return ChampionSkin(
      id: json['id'],
      num: json['num'],
      name: json['name'],
      splashImage: '${Constants.BaseSplashImagePath}${json['champion']}_${json['num']}.jpg',
      loadingImage: '${Constants.BaseLoadingImagePath}${json['champion']}_${json['num']}.jpg',
    );
  }
}

class ChampionStats {
  final String hp;
  final String hpPerLevel;
  final String mp;
  final String mpPerLevel;
  final String moveSpeed;
  final String armor;
  final String armorPerLevel;
  final String spellBlock;
  final String spellBlockPerLevel;
  final String attackRange;
  final String hpRegen;
  final String hpRegenPerLevel;
  final String mpRegen;
  final String mpRegenPerLevel;
  final String crit;
  final String critPerLevel;
  final String attackDamage;
  final String attactDamagePerLevel;
  final String attackSpeedPerLevel;
  final String attackSpeed;

  ChampionStats(
      {this.hp,
        this.hpPerLevel,
        this.mp,
        this.mpPerLevel,
        this.moveSpeed,
        this.armor,
        this.armorPerLevel,
        this.spellBlock,
        this.spellBlockPerLevel,
        this.attackRange,
        this.hpRegen,
        this.hpRegenPerLevel,
        this.mpRegen,
        this.mpRegenPerLevel,
        this.crit,
        this.critPerLevel,
        this.attackDamage,
        this.attactDamagePerLevel,
        this.attackSpeedPerLevel,
        this.attackSpeed});

  factory ChampionStats.formJson(json) {
    return ChampionStats(
        hp: json['hp'].toString() ?? '',
        hpPerLevel: json['hpperlevel'].toString() ?? '',
        mp: json['mp'].toString() ?? '',
        mpPerLevel: json['mpperlevel'].toString() ?? '',
        moveSpeed: json['movespeed'].toString() ?? '',
        armor: json['armor'].toString() ?? '',
        armorPerLevel: json['armorperlevel'].toString() ?? '',
        spellBlock: json['spellblack'].toString() ?? '',
        spellBlockPerLevel: json['spellblockperlevel'].toString() ?? '',
        attackRange: json['attackrange'].toString() ?? '',
        hpRegen: json['hpregen'].toString() ?? '',
        hpRegenPerLevel: json['hpregenperlevel'].toString() ?? '',
        mpRegen: json['mpregen'].toString() ?? '',
        mpRegenPerLevel: json['mpregenperlevel'] .toString() ?? '',
        crit: json['crit'].toString() ?? '',
        critPerLevel: json['critperlevel'].toString() ?? '',
        attackDamage: json['attackdamage'].toString() ?? '',
        attactDamagePerLevel: json['attackdamageperlevel'].toString() ?? '',
        attackSpeedPerLevel: json['attackspeedperlevel'].toString() ?? '',
        attackSpeed: json['attackspeed'].toString() ?? '');
  }
}


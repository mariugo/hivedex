import 'dart:convert';

import 'package:hive/hive.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 0)
class Pokemon extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String number;

  @HiveField(2)
  String name;

  @HiveField(3)
  String category;

  @HiveField(4)
  bool isFavorite;

  @HiveField(5)
  String imageUrl;

  @HiveField(6)
  int height;

  @HiveField(7)
  int weight;

  @HiveField(8)
  int hp;

  @HiveField(9)
  int attack;

  @HiveField(10)
  int defense;

  @HiveField(11)
  int specialAttack;

  @HiveField(12)
  int specialDefense;

  @HiveField(13)
  int speed;

  @HiveField(14)
  String normalAbility;

  @HiveField(15)
  String type;

  Pokemon(
      {this.id,
      required this.speed,
      required this.imageUrl,
      required this.number,
      required this.name,
      required this.category,
      this.isFavorite = false,
      required this.height,
      required this.attack,
      required this.defense,
      required this.hp,
      required this.specialAttack,
      required this.specialDefense,
      required this.weight,
      required this.normalAbility,
      required this.type});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'number': number});
    result.addAll({'name': name});
    result.addAll({'category': category});
    result.addAll({'isFavorite': isFavorite});
    result.addAll({'imageUrl': imageUrl});
    result.addAll({'height': height});
    result.addAll({'weight': weight});
    result.addAll({'hp': hp});
    result.addAll({'attack': attack});
    result.addAll({'defence': defense});
    result.addAll({'specialAttack': specialAttack});
    result.addAll({'specialDefence': specialDefense});
    result.addAll({'speed': speed});
    result.addAll({'normalAbility': normalAbility});
    result.addAll({'type': type});

    return result;
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id']?.toInt(),
      number: map['number'] ?? '',
      name: map['name'] ?? '',
      category: map['category'] ?? '',
      isFavorite: map['isFavorite'] ?? false,
      imageUrl: map['imageUrl'] ?? '',
      height: map['height']?.toInt() ?? 0,
      weight: map['weight']?.toInt() ?? 0,
      hp: map['hp']?.toInt() ?? 0,
      attack: map['attack']?.toInt() ?? 0,
      defense: map['defence']?.toInt() ?? 0,
      specialAttack: map['specialAttack']?.toInt() ?? 0,
      specialDefense: map['specialDefence']?.toInt() ?? 0,
      speed: map['speed']?.toInt() ?? 0,
      normalAbility: map['abilities'] ?? '',
      type: map['type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  Pokemon.fromJson(Map map)
      : id = map['id']?.toInt(),
        number = map['number'],
        name = map['name'],
        category = map['category'],
        isFavorite = map['isFavorite'],
        imageUrl = map['imageUrl'],
        height = map['height'],
        weight = map['weight'],
        hp = map['hp'],
        attack = map['attack'],
        defense = map['defence'],
        specialAttack = map['specialAttack'],
        specialDefense = map['specialDefence'],
        speed = map['speed'],
        normalAbility = map['normalAbility'],
        type = map['type'];
}

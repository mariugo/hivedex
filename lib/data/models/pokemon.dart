import 'dart:convert';

import 'package:hive/hive.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 0)
class Pokemon extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String number;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final bool isFavorite;

  @HiveField(5)
  final String imageUrl;

  @HiveField(6)
  final int height;

  @HiveField(7)
  final int weight;

  @HiveField(8)
  final int hp;

  @HiveField(9)
  final int attack;

  @HiveField(10)
  final int defence;

  @HiveField(11)
  final int specialAttack;

  @HiveField(12)
  final int specialDefence;

  @HiveField(13)
  final int speed;

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
      required this.defence,
      required this.hp,
      required this.specialAttack,
      required this.specialDefence,
      required this.weight});

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
    result.addAll({'defence': defence});
    result.addAll({'specialAttack': specialAttack});
    result.addAll({'specialDefence': specialDefence});
    result.addAll({'speed': speed});

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
      defence: map['defence']?.toInt() ?? 0,
      specialAttack: map['specialAttack']?.toInt() ?? 0,
      specialDefence: map['specialDefence']?.toInt() ?? 0,
      speed: map['speed']?.toInt() ?? 0,
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
        defence = map['defence'],
        specialAttack = map['specialAttack'],
        specialDefence = map['specialDefence'],
        speed = map['speed'];
}

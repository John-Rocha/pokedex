import 'dart:convert';

class Pokemon {
  final int id;
  final String name;
  final String img;
  final String num;
  final List<String> type;

  Pokemon({
    required this.id,
    required this.name,
    required this.img,
    required this.num,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'img': img,
      'num': num,
      'type': type,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id']?.toInt(),
      name: map['name'],
      img: map['img'],
      num: map['num'],
      type: List<String>.from(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Pokemon.fromJson(String source) =>
      Pokemon.fromMap(json.decode(source));
}

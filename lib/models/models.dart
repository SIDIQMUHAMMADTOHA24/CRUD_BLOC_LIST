import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final int id;
  String name;
  String descriptions;
  UserModel({
    required this.id,
    required this.name,
    required this.descriptions,
  });

  @override
  String toString() =>
      'UserModel(id: $id, name: $name, descriptions: $descriptions)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'descriptions': descriptions,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      descriptions: map['descriptions'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    int? id,
    String? name,
    String? descriptions,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      descriptions: descriptions ?? this.descriptions,
    );
  }
}

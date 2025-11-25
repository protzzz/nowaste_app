import 'dart:convert';

class UserModel {
  final String id;
  final String token;
  final String name;
  final String surname;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserModel({
    required this.id,
    required this.token,
    required this.name,
    required this.surname,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  UserModel copyWith({
    String? id,
    String? token,
    String? name,
    String? surname,
    String? email,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      token: token ?? this.token,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'token': token,
      'name': name,
      'surname': surname,
      'email': email,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      // 'createdAt': createdAt.millisecondsSinceEpoch,
      // 'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      token: map['token'] ?? '',
      name: map['name'] ?? '',
      surname: map['surname'] ?? '',
      email: map['email'] ?? '',
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),

      // id: map['id'] as String,
      // token: map['token'] as String,
      // name: map['name'] as String,
      // surname: map['surname'] as String,
      // email: map['email'] as String,
      // createdAt: DateTime.fromMillisecondsSinceEpoch(
      //   map['createdAt'] as int,
      // ),
      // updatedAt: DateTime.fromMillisecondsSinceEpoch(
      //   map['updatedAt'] as int,
      // ),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, token: $token, name: $name, surname: $surname, email: $email, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.token == token &&
        other.name == name &&
        other.surname == surname &&
        other.email == email &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        token.hashCode ^
        name.hashCode ^
        surname.hashCode ^
        email.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}

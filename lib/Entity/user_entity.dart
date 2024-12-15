// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String name;
  final String pass;

  User({ required this.name, required this.pass});

  User copyWith({
    String? name,
    String? pass,
  }) {
    return User(
      name: name ?? this.name,
      pass: pass ?? this.pass,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'pass': pass,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      pass: map['pass'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, pass: $pass)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
    return 
      other.name == name &&
      other.pass == pass;
  }

  @override
  int get hashCode => name.hashCode ^ pass.hashCode;
}

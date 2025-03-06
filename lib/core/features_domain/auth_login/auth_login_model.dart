// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AuthLoginModel {

  final String id;
  final String username;
  final String email;
  final String passwordHash;
  final String firstName;
  final String lastName;

  AuthLoginModel({
    required this.id,
    required this.username,
    required this.email,
    required this.passwordHash,
    required this.firstName,
    required this.lastName,
  });

  AuthLoginModel copyWith({
    String? id,
    String? username,
    String? email,
    String? passwordHash,
    String? firstName,
    String? lastName,
  }) {
    return AuthLoginModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      passwordHash: passwordHash ?? this.passwordHash,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'passwordHash': passwordHash,
      'firstName': firstName,
      'lastName': lastName,
    };
  }

  factory AuthLoginModel.fromMap(Map<String, dynamic> map) {
    return AuthLoginModel(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      passwordHash: map['passwordHash'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthLoginModel.fromJson(String source) => AuthLoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AuthLoginModel(id: $id, username: $username, email: $email, passwordHash: $passwordHash, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(covariant AuthLoginModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.username == username &&
      other.email == email &&
      other.passwordHash == passwordHash &&
      other.firstName == firstName &&
      other.lastName == lastName;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      email.hashCode ^
      passwordHash.hashCode ^
      firstName.hashCode ^
      lastName.hashCode;
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class User {
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------

  final String email;
  final String nickName;
  final String? phone;
  User({
    required this.email,
    required this.nickName,
    this.phone,
  });

  User copyWith({
    String? email,
    String? nickName,
    String? phone,
  }) {
    return User(
      email: email ?? this.email,
      nickName: nickName ?? this.nickName,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'nickName': nickName,
      'phone': phone,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      nickName: map['nickName'] ?? '',
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() =>
      'User(email: $email, nickName: $nickName, phone: $phone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.email == email &&
        other.nickName == nickName &&
        other.phone == phone;
  }

  @override
  int get hashCode => email.hashCode ^ nickName.hashCode ^ phone.hashCode;
}

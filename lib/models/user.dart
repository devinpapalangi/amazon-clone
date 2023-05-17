// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  final List<dynamic> cart;

  User(this.id, this.name, this.email, this.password, this.address, this.type,
      this.token, this.cart);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'cart': cart,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['_id'] as String,
      map['name'] as String,
      map['email'] as String,
      map['password'] as String,
      map['address'] as String,
      map['type'] as String,
      map['token'] as String,
      map['cart'] as List<dynamic>,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return User(
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      password ?? this.password,
      address ?? this.address,
      type ?? this.type,
      token ?? this.token,
      cart ?? this.cart,
    );
  }
}

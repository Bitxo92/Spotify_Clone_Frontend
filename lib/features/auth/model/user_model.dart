import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String id;

  UserModel({required this.name, required this.email, required this.id});

  UserModel copyWith({String? name, String? email, String? id}) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'email': email, 'id': id};
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      id: map['id'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(name: $name, email: $email, id: $id)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ id.hashCode;
}

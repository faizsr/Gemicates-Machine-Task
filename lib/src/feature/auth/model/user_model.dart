class UserModel {
  final String? name;
  final String email;
  final String? password;

  UserModel({
    this.name,
    required this.email,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
      };
}

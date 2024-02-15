class User {
  final String email;
  final String password;

  User({required this.email, required this.password});

  @override
  String toString() {
    return 'User{email: $email, password: $password}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User && runtimeType == other.runtimeType && email == other.email && password == other.password;

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
  });

  toJson() {
    return {"name": name, "email": email, "password": password};
  }
}

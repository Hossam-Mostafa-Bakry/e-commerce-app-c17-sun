class SignInRequestData {

  final String email;
  final String password;

  SignInRequestData({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
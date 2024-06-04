class RegisterReq {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterReq({required this.username, required this.email, required this.password, required this.confirmPassword});

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };
}

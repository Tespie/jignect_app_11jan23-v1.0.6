class RegisterUserReq {
  String? username;
  String? email;
  String? password;

  RegisterUserReq({this.username, this.email, this.password});

  RegisterUserReq.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (username != null) {
      data['username'] = username;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (password != null) {
      data['password'] = password;
    }
    return data;
  }
}

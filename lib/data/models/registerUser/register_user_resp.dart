class RegisterUserResp {
  String? status;
  String? message;
  Data? data;

  RegisterUserResp({this.status, this.message, this.data});

  RegisterUserResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (status != null) {
      data['status'] = status;
    }
    if (message != null) {
      data['message'] = message;
    }
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    return data;
  }
}

class Data {
  String? username;
  String? email;
  String? id;

  Data({this.username, this.email, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (username != null) {
      data['username'] = username;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (id != null) {
      data['id'] = id;
    }
    return data;
  }
}

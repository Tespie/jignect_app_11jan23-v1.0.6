import 'package:json_annotation/json_annotation.dart';

part 'LoginResponse.g.dart';

@JsonSerializable()
class LoginResponse {
  String? status;
  String? message;
  Data? data;

  LoginResponse({this.status, this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class Data {
  String? id;
  String? email;
  String? username;
  // String? mobileNo;
  // int? loginRetryLimit;
  // String? token;
  // bool? isDeleted;

  Data({
    this.id,
    this.email,
    this.username,
    // this.mobileNo,
    // this.loginRetryLimit,
    // this.token,
    // this.isDeleted
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

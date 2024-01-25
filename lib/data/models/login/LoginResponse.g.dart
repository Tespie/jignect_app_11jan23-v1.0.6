// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      // mobileNo: json['mobileNo'] as String?,
      // loginRetryLimit: json['loginRetryLimit'] as int?,
      // token: json['token'] as String?,
      // isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      // 'mobileNo': instance.mobileNo,
      // 'loginRetryLimit': instance.loginRetryLimit,
      // 'token': instance.token,
      // 'isDeleted': instance.isDeleted,
    };

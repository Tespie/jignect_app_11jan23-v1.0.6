// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jignect_app_11jan23/core/app_export.dart';
import 'package:jignect_app_11jan23/core/utils/progress_dialog_utils.dart';
import 'package:jignect_app_11jan23/data/apiClient/network_interceptor.dart';
import 'package:jignect_app_11jan23/data/models/login/LoginResponse.dart';
import 'package:jignect_app_11jan23/data/models/login/login_user_resp.dart';
import 'package:jignect_app_11jan23/data/models/registerUser/register_user_resp.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  /// api base url
  // var url = "http://localhost:5000";
  var url = "http://192.168.1.135:5000";

  ApiClient._internal();

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 60),
  ))
    ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  Future<LoginUserResp> login_API({Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/api/auth/login',
        data: requestData,
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return LoginUserResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? LoginUserResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

// tj added - not working
  // Future<LoginResponse> login_API(
  //     {Map<String, String> headers = const {}
  //     Map requestData = const {}})

  // Future<LoginResponse> login_API({Map requestData = const {}}) async {
  Future<LoginUserResp> login_API_not_working(
      {Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();

    try {
      await isNetworkConnected();

      // Fluttertoast.showToast(msg: "msg 1");

      // var response = await _dio.post('$url/login',
      // var response = await _dio.post('$url/device/auth/login',
      // var response = await _dio.post('$url/api/auth/login',
      //     data: requestData, options: Options(headers: headers));

      var response = await _dio.post(
        '$url/api/auth/login',
        data: requestData,
        options: Options(),
      );

      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return LoginUserResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? LoginUserResp.fromJson(response.data)
            : "Something wrong with LOGIN API";
      }
    } catch (error, stackTrace) {
      Fluttertoast.showToast(msg: "errrrrr");
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // tj added directly
  /// Performs API call for http://localhost:5000/api/auth/register
  ///
  /// Sends a POST request to the server's 'http://localhost:5000/api/auth/register' endpoint
  /// with the provided headers and request data
  /// Returns a [RegisterUserResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<RegisterUserResp> registerUser({Map requestData = const {}}) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/api/auth/register',
        data: requestData,
        options: Options(),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return RegisterUserResp.fromJson(response.data);
      } else {
        throw response.data != null
            ? RegisterUserResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}

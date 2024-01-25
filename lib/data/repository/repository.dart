import 'package:jignect_app_11jan23/data/apiClient/api_client.dart';
import 'package:jignect_app_11jan23/data/models/login/LoginResponse.dart';
import 'package:jignect_app_11jan23/data/models/login/login_user_resp.dart';
import 'package:jignect_app_11jan23/data/models/registerUser/register_user_resp.dart';

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();

// tj added
  // Future<LoginResponse> callLoginAPI({
  Future<LoginUserResp> callLoginAPI({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    // return await _apiClient.login_API(
    //   headers: headers,
    //   requestData: requestData,
    // );
    return await _apiClient.login_API(
      requestData: requestData,
    );
  }

// tj added directly
  Future<RegisterUserResp> registerUser({Map requestData = const {}}) async {
    return await _apiClient.registerUser(
      requestData: requestData,
    );
  }
}

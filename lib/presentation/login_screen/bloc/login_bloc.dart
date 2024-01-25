import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jignect_app_11jan23/data/models/login/login_user_req.dart';
import 'package:jignect_app_11jan23/data/models/login/login_user_resp.dart';
// import 'package:jignect_app_11jan23/data/models/login/LoginRequest.dart';
// import 'package:jignect_app_11jan23/data/models/login/LoginResponse.dart';
import 'package:jignect_app_11jan23/data/repository/repository.dart';
import '/core/app_export.dart';
import 'package:jignect_app_11jan23/presentation/login_screen/models/login_model.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<LoginApiEvent>(_callLoginApi);
  }

  final _repository = Repository();
  var loginResponse = LoginUserResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _onInitialize(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPassword: true));
  }

// tj added
  FutureOr<void> _callLoginApi(
    LoginApiEvent event,
    Emitter<LoginState> emit,
  ) async {
    var requestJson = LoginUserReq(
      email: state.emailController?.text ?? '',
      password: state.passwordController?.text ?? '',
    );

    await _repository
        .callLoginAPI(
      // headers: {
      //   'Content-Type': 'application/json',
      // },
      requestData: requestJson.toJson(),
    )
        .then((value) async {
      loginResponse = value;
      _onLoginSuccess(value, emit);
      event.onLoginApiSuccessEvent?.call();
    }).onError((error, stackTrace) {
      _onLoginError();
      event.onLoginApiErrorEvent?.call();
    });
  }

  void _onLoginSuccess(LoginUserResp value, Emitter<LoginState> emit) {}

  void _onLoginError() {}
}

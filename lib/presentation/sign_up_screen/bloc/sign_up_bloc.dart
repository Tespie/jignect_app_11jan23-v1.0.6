import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jignect_app_11jan23/data/models/registerUser/register_user_req.dart';
import '/core/app_export.dart';
import 'package:jignect_app_11jan23/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:jignect_app_11jan23/data/models/registerUser/register_user_resp.dart';
import 'dart:async';
import 'package:jignect_app_11jan23/data/repository/repository.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

/// A bloc that manages the state of a SignUp according to the event that is dispatched to it.
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(SignUpState initialState) : super(initialState) {
    on<SignUpInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<CreateRegisterEvent>(_callRegisterUser);
  }

  final _repository = Repository();

  var postRegisterUserResp = RegisterUserResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(agreeToTerms: event.value));
  }

  _onInitialize(
    SignUpInitialEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true,
        agreeToTerms: false));
  }

  /// Calls [http://localhost:5000/api/auth/register] with the provided event and emits the state.
  ///
  /// The [CreateRegisterEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callRegisterUser(
    CreateRegisterEvent event,
    Emitter<SignUpState> emit,
  ) async {
    var postRegisterUserReq = RegisterUserReq(
      username: state.nameController?.text ?? '',
      email: state.emailController?.text ?? '',
      password: state.passwordController?.text ?? '',
    );
    await _repository
        .registerUser(
      requestData: postRegisterUserReq.toJson(),
    )
        .then((value) async {
      postRegisterUserResp = value;
      _onRegisterUserSuccess(value, emit);
      event.onCreateRegisterEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onRegisterUserError();
      event.onCreateRegisterEventError?.call();
    });
  }

  void _onRegisterUserSuccess(
    RegisterUserResp resp,
    Emitter<SignUpState> emit,
  ) {
    PrefUtils().setUsername(resp.data?.username ?? '');
    PrefUtils().setEmail(resp.data?.email ?? '');
    PrefUtils().setUserid(resp.data?.id ?? '');
    emit(
      state.copyWith(
        signUpModelObj: state.signUpModelObj?.copyWith(),
      ),
    );
  }

  void _onRegisterUserError() {
    //implement error method body...
  }
}

// ignore_for_file: must_be_immutable

part of 'sign_up_bloc.dart';

/// Represents the state of SignUp in the application.
class SignUpState extends Equatable {
  SignUpState({
    this.nameController,
    this.emailController,
    this.passwordController,
    this.confirmPasswordController,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.agreeToTerms = false,
    this.signUpModelObj,
  });

  TextEditingController? nameController;

  TextEditingController? emailController;

  TextEditingController? passwordController;

  TextEditingController? confirmPasswordController;

  SignUpModel? signUpModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  bool agreeToTerms;

  @override
  List<Object?> get props => [
        nameController,
        emailController,
        passwordController,
        confirmPasswordController,
        isShowPassword,
        isShowPassword1,
        agreeToTerms,
        signUpModelObj,
      ];
  SignUpState copyWith({
    TextEditingController? nameController,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? confirmPasswordController,
    bool? isShowPassword,
    bool? isShowPassword1,
    bool? agreeToTerms,
    SignUpModel? signUpModelObj,
  }) {
    return SignUpState(
      nameController: nameController ?? this.nameController,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      confirmPasswordController:
          confirmPasswordController ?? this.confirmPasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      agreeToTerms: agreeToTerms ?? this.agreeToTerms,
      signUpModelObj: signUpModelObj ?? this.signUpModelObj,
    );
  }
}

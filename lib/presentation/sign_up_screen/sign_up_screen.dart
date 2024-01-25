import 'package:fluttertoast/fluttertoast.dart';
import 'package:jignect_app_11jan23/data/models/registerUser/register_user_resp.dart';

import 'bloc/sign_up_bloc.dart';
import 'models/sign_up_model.dart';
import 'package:flutter/material.dart';
import 'package:jignect_app_11jan23/core/app_export.dart';
import 'package:jignect_app_11jan23/core/utils/validation_functions.dart';
import 'package:jignect_app_11jan23/widgets/app_bar/appbar_title.dart';
import 'package:jignect_app_11jan23/widgets/app_bar/custom_app_bar.dart';
import 'package:jignect_app_11jan23/widgets/custom_checkbox_button.dart';
import 'package:jignect_app_11jan23/widgets/custom_elevated_button.dart';
import 'package:jignect_app_11jan23/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpBloc>(
        create: (context) =>
            SignUpBloc(SignUpState(signUpModelObj: SignUpModel()))
              ..add(SignUpInitialEvent()),
        child: SignUpScreen());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.h, vertical: 29.v),
                            child: Column(children: [
                              _buildName(context),
                              SizedBox(height: 16.v),
                              _buildEmail(context),
                              SizedBox(height: 16.v),
                              _buildPassword(context),
                              SizedBox(height: 16.v),
                              _buildConfirmPassword(context),
                              SizedBox(height: 17.v),
                              _buildAgreeToTerms(context),
                              SizedBox(height: 31.v),
                              _buildSignUpButton(context),
                              SizedBox(height: 27.v),
                              GestureDetector(
                                  onTap: () {
                                    clickLogin(context);
                                  },
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_already_have_an2".tr,
                                            style: CustomTextStyles
                                                .bodyMediumRobotoff707684),
                                        TextSpan(text: " "),
                                        TextSpan(
                                            text: "lbl_log_in2".tr,
                                            style: CustomTextStyles
                                                .bodyMediumRobotoff004b7e)
                                      ]),
                                      textAlign: TextAlign.left)),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        centerTitle: true, title: AppbarTitle(text: "lbl_sign_up".tr));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
        selector: (state) => state.nameController,
        builder: (context, nameController) {
          return CustomTextFormField(
              controller: nameController,
              hintText: "lbl_enter_your_name".tr,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgImage6,
                      height: 24.adaptSize,
                      width: 24.adaptSize)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (!isText(value)) {
                  return "err_msg_please_enter_valid_text".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return BlocSelector<SignUpBloc, SignUpState, TextEditingController?>(
        selector: (state) => state.emailController,
        builder: (context, emailController) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "msg_enter_your_email".tr,
              textInputType: TextInputType.emailAddress,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(25.h, 18.v, 17.h, 19.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgImage2,
                      height: 19.v,
                      width: 22.h)),
              prefixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return CustomTextFormField(
          controller: state.passwordController,
          hintText: "msg_enter_your_password".tr,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgImage1,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          suffix: InkWell(
              onTap: () {
                context.read<SignUpBloc>().add(ChangePasswordVisibilityEvent(
                    value: !state.isShowPassword));
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 17.v, 26.h, 17.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgImage3,
                      height: 22.adaptSize,
                      width: 22.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: state.isShowPassword,
          contentPadding: EdgeInsets.symmetric(vertical: 18.v));
    });
  }

  /// Section Widget
  Widget _buildConfirmPassword(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return CustomTextFormField(
          controller: state.confirmPasswordController,
          hintText: "msg_confirm_your_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          prefix: Container(
              margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgImage1,
                  height: 24.adaptSize,
                  width: 24.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 56.v),
          suffix: InkWell(
              onTap: () {
                context.read<SignUpBloc>().add(ChangePasswordVisibilityEvent1(
                    value: !state.isShowPassword1));
              },
              child: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 17.v, 26.h, 17.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgImage3,
                      height: 22.adaptSize,
                      width: 22.adaptSize))),
          suffixConstraints: BoxConstraints(maxHeight: 56.v),
          validator: (value) {
            if (value == null || (!isValidPassword(value, isRequired: true))) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
          obscureText: state.isShowPassword1,
          contentPadding: EdgeInsets.symmetric(vertical: 18.v));
    });
  }

  /// Section Widget
  Widget _buildAgreeToTerms(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(right: 12.h),
            child: BlocSelector<SignUpBloc, SignUpState, bool?>(
                selector: (state) => state.agreeToTerms,
                builder: (context, agreeToTerms) {
                  return CustomCheckboxButton(
                      alignment: Alignment.centerLeft,
                      text: "msg_i_agree_to_the_jignect".tr,
                      isExpandedText: true,
                      value: agreeToTerms,
                      onChange: (value) {
                        context
                            .read<SignUpBloc>()
                            .add(ChangeCheckBoxEvent(value: value));
                      });
                })));
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        onPressed: () {
          clickSignUp(context);
        });
  }

  /// Calls the http://localhost:5000/api/auth/register API and triggers a [CreateRegisterEvent] event on the [SignUpBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateRegisterEvent] event on the [SignUpBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  clickSignUp(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SignUpBloc>().add(
            CreateRegisterEvent(
              onCreateRegisterEventSuccess: () {
                _onRegisterUserEventSuccess(context);
              },
              onCreateRegisterEventError: () {
                _onRegisterUserEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the dashboardScreen when the action is triggered.
  void _onRegisterUserEventSuccess(BuildContext context) {
    // NavigatorService.pushNamedAndRemoveUntil(
    //   AppRoutes.dashboardScreen,
    // );

    RegisterUserResp registerUserResp =
        context.read<SignUpBloc>().postRegisterUserResp;
    Fluttertoast.showToast(msg: 'res = ' + registerUserResp.message.toString());
    if (registerUserResp.status == "200") {
      Fluttertoast.showToast(msg: registerUserResp.message.toString());
    } else {
      Fluttertoast.showToast(msg: registerUserResp.message.toString());
    }
  }

  /// Displays a snackBar message when the action is triggered.
  /// The data is retrieved from the `PostRegisterUserResp` property of the
  /// `SignUpBloc` using the `context.read` method.}
  void _onRegisterUserEventError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(context
                .read<SignUpBloc>()
                .postRegisterUserResp
                .message
                .toString() ??
            '')));
  }

  /// Navigates to the loginScreen when the action is triggered.
  clickLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}

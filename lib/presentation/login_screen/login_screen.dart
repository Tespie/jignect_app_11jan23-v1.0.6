import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:jignect_app_11jan23/core/app_export.dart';
import 'package:jignect_app_11jan23/core/utils/validation_functions.dart';
import 'package:jignect_app_11jan23/widgets/app_bar/appbar_leading_image.dart';
import 'package:jignect_app_11jan23/widgets/app_bar/appbar_title.dart';
import 'package:jignect_app_11jan23/widgets/app_bar/custom_app_bar.dart';
import 'package:jignect_app_11jan23/widgets/custom_elevated_button.dart';
import 'package:jignect_app_11jan23/widgets/custom_outlined_button.dart';
import 'package:jignect_app_11jan23/widgets/custom_text_form_field.dart';
import 'package:jignect_app_11jan23/domain/googleauth/google_auth_helper.dart';
import 'package:jignect_app_11jan23/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
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
                                horizontal: 16.h, vertical: 24.v),
                            child: Column(children: [
                              _buildEmail(context),
                              SizedBox(height: 16.v),
                              _buildPassword(context),
                              SizedBox(height: 10.v),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                      padding: EdgeInsets.only(right: 8.h),
                                      child: Text("msg_forgot_password".tr,
                                          style: theme.textTheme.titleSmall))),
                              SizedBox(height: 32.v),
                              _buildLoginButton(context),
                              SizedBox(height: 27.v),
                              RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: theme.textTheme.bodyMedium),
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: "lbl_sign_up".tr,
                                        style:
                                            CustomTextStyles.bodyMediumff004b7e)
                                  ]),
                                  textAlign: TextAlign.left),
                              SizedBox(height: 32.v),
                              _buildRowEleven(context),
                              SizedBox(height: 28.v),
                              _buildSignInWithGoogleButton(context),
                              SizedBox(height: 16.v),
                              _buildSignInWithAppleButton(context),
                              SizedBox(height: 16.v),
                              _buildSignInWithFacebookButton(context),
                              SizedBox(height: 5.v)
                            ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 56.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgIconChevronLeft,
            margin: EdgeInsets.only(left: 32.h, top: 16.v, bottom: 15.v)),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_login".tr));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: BlocSelector<LoginBloc, LoginState, TextEditingController?>(
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
                    if (value == null ||
                        (!isValidEmail(value, isRequired: true))) {
                      return "err_msg_please_enter_valid_email".tr;
                    }
                    return null;
                  });
            }));
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
          return CustomTextFormField(
              controller: state.passwordController,
              hintText: "msg_enter_your_password".tr,
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
                    context.read<LoginBloc>().add(ChangePasswordVisibilityEvent(
                        value: !state.isShowPassword));
                  },
                  child: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 17.v, 25.h, 17.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgImage3,
                          height: 22.adaptSize,
                          width: 22.adaptSize))),
              suffixConstraints: BoxConstraints(maxHeight: 56.v),
              validator: (value) {
                if (value == null ||
                    (!isValidPassword(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_password".tr;
                }
                return null;
              },
              obscureText: state.isShowPassword,
              contentPadding: EdgeInsets.symmetric(vertical: 18.v));
        }));
  }

  /// Section Widget
  Widget _buildLoginButton(BuildContext context) {
    return CustomElevatedButton(text: "lbl_login".tr);
  }

  /// Section Widget
  Widget _buildRowEleven(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 9.v),
              child: SizedBox(width: 141.h, child: Divider())),
          Text("lbl_or".tr, style: CustomTextStyles.bodyLargeInterBluegray300),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 9.v),
              child: SizedBox(width: 141.h, child: Divider()))
        ]));
  }

  /// Section Widget
  Widget _buildSignInWithGoogleButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_google".tr,
        margin: EdgeInsets.symmetric(horizontal: 8.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgImage4,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        onPressed: () {
          onTapSignInWithGoogleButton(context);
        });
  }

  /// Section Widget
  Widget _buildSignInWithAppleButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_apple".tr,
        margin: EdgeInsets.symmetric(horizontal: 8.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgVector,
                height: 19.v,
                width: 16.h)));
  }

  /// Section Widget
  Widget _buildSignInWithFacebookButton(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_sign_in_with_facebook".tr,
        margin: EdgeInsets.symmetric(horizontal: 8.h),
        leftIcon: Container(
            margin: EdgeInsets.only(right: 30.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgImage5,
                height: 20.adaptSize,
                width: 20.adaptSize)),
        onPressed: () {
          onTapSignInWithFacebookButton(context);
        });
  }

  onTapSignInWithGoogleButton(BuildContext context) async {
    await GoogleAuthHelper().googleSignInProcess().then((googleUser) {
      if (googleUser != null) {
        //TODO Actions to be performed after signin
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('user data is empty')));
      }
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }

  onTapSignInWithFacebookButton(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}

import 'package:jignect_app_11jan23/presentation/login_screen/login_screen.dart';

import 'bloc/intro_bloc.dart';
import 'models/intro_model.dart';
import 'package:flutter/material.dart';
import 'package:jignect_app_11jan23/core/app_export.dart';
import 'package:jignect_app_11jan23/widgets/custom_elevated_button.dart';
import 'package:jignect_app_11jan23/widgets/custom_outlined_button.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<IntroBloc>(
      create: (context) => IntroBloc(IntroState(
        introModelObj: IntroModel(),
      ))
        ..add(IntroInitialEvent()),
      child: IntroScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroBloc, IntroState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              width: double.maxFinite,
              padding: EdgeInsets.only(
                left: 16.h,
                top: 128.v,
                right: 16.h,
              ),
              child: Column(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgJtMainLogo01Png,
                    height: 121.v,
                    width: 136.h,
                  ),
                  SizedBox(height: 52.v),
                  Text(
                    "msg_let_s_get_started".tr,
                    style: theme.textTheme.titleLarge,
                  ),
                  SizedBox(height: 24.v),
                  SizedBox(
                    // width: 233.h,
                    child: Text(
                      "msg_login_to_sfdfgz".tr,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyLargeGray600.copyWith(
                          // height: 1.50,
                          ),
                    ),
                  ),
                  SizedBox(height: 55.v),
                  CustomElevatedButton(
                    text: "lbl_login".tr,
                    onPressed: () {
                      NavigatorService.pushNamed(AppRoutes.loginScreen);
                    },
                  ),
                  SizedBox(height: 16.v),
                  CustomOutlinedButton(
                    text: "lbl_sign_up".tr,
                    buttonStyle: CustomButtonStyles.outlineOnPrimary,
                    buttonTextStyle: CustomTextStyles.titleMediumOnPrimary,
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

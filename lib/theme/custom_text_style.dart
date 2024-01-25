import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyLargeBlack900 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.black900,
      );
  static get bodyLargeGray600 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray600,
      );
  static get bodyLargeGray60001 => theme.textTheme.bodyLarge!.copyWith(
        color: appTheme.gray60001,
      );
  static get bodyLargeInterBluegray300 =>
      theme.textTheme.bodyLarge!.inter.copyWith(
        color: appTheme.blueGray300,
      );
  static get bodyLargeOnError => theme.textTheme.bodyLarge!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get bodyMediumRobotoff004b7e =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: Color(0XFF004B7E),
        fontSize: 15.fSize,
      );
  static get bodyMediumRobotoff707684 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: Color(0XFF707684),
        fontSize: 15.fSize,
      );
  static get bodyMediumRobotoff70768415 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: Color(0XFF707684),
        fontSize: 15.fSize,
      );
  static get bodyMediumRobotoff828282 =>
      theme.textTheme.bodyMedium!.roboto.copyWith(
        color: Color(0XFF828282),
      );
  static get bodyMediumSFProDisplayBluegray800 =>
      theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: appTheme.blueGray800,
        fontSize: 13.fSize,
      );
  static get bodyMediumSFProDisplayGray600 =>
      theme.textTheme.bodyMedium!.sFProDisplay.copyWith(
        color: appTheme.gray600,
        fontSize: 15.fSize,
      );
  static get bodyMedium_1 => theme.textTheme.bodyMedium!;
  static get bodyMediumff004b7e => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF004B7E),
      );
  static get bodyMediumff828282 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF828282),
      );
  // Headline text style
  static get headlineSmallMedium => theme.textTheme.headlineSmall!.copyWith(
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleLargeOnError => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onError,
        fontWeight: FontWeight.w400,
      );
  static get titleLargeOnErrorContainer => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 22.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumBluegray300 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray300,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumInterGray900 =>
      theme.textTheme.titleMedium!.inter.copyWith(
        color: appTheme.gray900,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumOnErrorContainer =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onErrorContainer,
        fontSize: 18.fSize,
        fontWeight: FontWeight.w700,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );
  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleSmallInterPrimary =>
      theme.textTheme.titleSmall!.inter.copyWith(
        color: theme.colorScheme.primary,
      );
}

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get sFProDisplay {
    return copyWith(
      fontFamily: 'SF Pro Display',
    );
  }
}

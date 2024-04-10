import 'package:flutter/material.dart';

import 'package:music_app/util/dimen.dart';

class AppTextStyles {
  static const String poppinsBold = 'Poppins-bold';
  static const String poppinsMedium = 'Poppins-medium';
  static const String poppinsRegular = 'Poppins-regular';
  static const String poppinsLight = 'Poppins-light';

  static TextStyle baseTextStyle = const TextStyle(
    color: Color(0xFF000000),
    fontFamily: poppinsRegular, // Default to regular font
    letterSpacing: 0.2,
    height: 1.0,
  );

  static TextStyle headerStyle = baseTextStyle.copyWith(
    fontFamily: poppinsBold,
    color: Colors.white,
    fontSize: Dimensions.dimen20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static TextStyle authenticationButtonStyle = baseTextStyle.copyWith(
    fontFamily: poppinsBold,
    color: Colors.white,
    fontSize: Dimensions.dimen20,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static TextStyle settingsTextStyle = baseTextStyle.copyWith(
    fontFamily: poppinsBold,
    fontSize: Dimensions.dimen12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static TextStyle homeWelcomeTextStyle = baseTextStyle.copyWith(
    fontFamily: poppinsRegular,
    fontSize: Dimensions.dimen15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static TextStyle searchTextStyle = baseTextStyle.copyWith(
    fontFamily: poppinsMedium,
    fontSize: Dimensions.dimen15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static TextStyle songTitleTextStyle = baseTextStyle.copyWith(
    fontFamily: poppinsBold,
    fontSize: Dimensions.dimen15,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

  static TextStyle songDescTextStyle = baseTextStyle.copyWith(
    fontFamily: poppinsLight,
    fontSize: Dimensions.dimen12,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
  );

}
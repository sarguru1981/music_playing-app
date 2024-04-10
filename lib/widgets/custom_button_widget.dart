import 'package:flutter/material.dart';

import 'package:music_app/util/color.dart';

import 'package:music_app/util/dimen.dart';

import 'package:music_app/themes/app_style.dart';

class CustomButtonWidget extends StatelessWidget {
  var btnText = "";
  var onClick;

  CustomButtonWidget({required this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: Dimensions.dimen40,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          borderRadius: const BorderRadius.all(
            Radius.circular(Dimensions.dimen100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: AppTextStyles.authenticationButtonStyle,
        ),
      ),
    );
  }
}

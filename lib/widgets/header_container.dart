import 'package:flutter/material.dart';

import 'package:music_app/util/color.dart';

import 'package:music_app/util/dimen.dart';

import 'package:music_app/themes/app_style.dart';

class _Constants {
  static const String logoImage = "assets/images/logo_image.png";
}

class HeaderContainer extends StatelessWidget {
  var text = "Login";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * Dimensions.dimen_0_dot_4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [orangeColors, orangeLightColors],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(Dimensions.dimen100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: Dimensions.dimen20,
              right: Dimensions.dimen20,
              child: Text(
                text,
                style: AppTextStyles.headerStyle,
              )),
          Center(
            child: Image.asset(_Constants.logoImage),
          ),
        ],
      ),
    );
  }
}
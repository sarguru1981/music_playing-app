import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/themes/ThemeProvider.dart';
import 'package:music_app/themes/app_style.dart';
import 'package:music_app/util/dimen.dart';
import 'package:provider/provider.dart';

import 'package:music_app/widgets/custom_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = isDarkMode(context) ? Colors.white : Colors.black;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: Text('Settings'),),
      drawer: CustomDrawer(),
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(Dimensions.dimen12)
        ),
        padding: const EdgeInsets.all(Dimensions.dimen16),
        margin: const EdgeInsets.all(Dimensions.dimen25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Dark Mode",
            style: AppTextStyles.settingsTextStyle.copyWith(color: textColor),
            ),

            CupertinoSwitch(
                value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
                onChanged: (value) => {
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme()
                }),
          ],
        ),
      ),
    );
  }

}
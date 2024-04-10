import 'package:flutter/material.dart';
import 'package:music_app/util/dimen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: Dimensions.dimen40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.dimen20, top: Dimensions.dimen20),
            child: ListTile(
              title: const Text('HOME'),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.dimen20, top: Dimensions.dimen20),
            child: ListTile(
              title: const Text('SETTINGS'),
              leading: const Icon(Icons.settings),
              onTap: (){
                Navigator.pushReplacementNamed(context, '/settings');
              },
            ),
          ),
        ],
      ),
    );
  }
}

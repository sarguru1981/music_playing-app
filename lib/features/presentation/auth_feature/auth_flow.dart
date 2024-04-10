import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:music_app/features/presentation/auth_feature/registration_screen.dart';

import 'package:music_app/features/presentation/home/home_screen.dart';

class AuthenticationFlowScreen extends StatelessWidget {
  const AuthenticationFlowScreen({super.key});
  static String id = 'main screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return RegistrationScreen();
          }
        },
      ),
    );
  }
}
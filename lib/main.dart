import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/themes/ThemeProvider.dart';
import 'features/presentation/auth_feature/auth_flow.dart';
import 'features/presentation/auth_feature/bloc/authentication_bloc.dart';
import 'features/presentation/auth_feature/login_screen.dart';
import 'features/presentation/details/playlist_detail_screen.dart';
import 'features/presentation/home/home_screen.dart';
import 'features/presentation/settings/settings_screen.dart';
import 'features/presentation/splash/splash_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A Music App',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/': (context) => const SplashScreen(),
        '/authentication': (context) => const AuthenticationFlowScreen(),
        '/login': (context) => LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/playlist': (context) => const PlaylistDetailScreen(),
      },
      //home: const AuthenticationFlowScreen()
    );
  }
}

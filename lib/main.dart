import 'package:chatbox_app/firebase_options.dart';
import 'package:chatbox_app/screens/auth/log_in.dart';
import 'package:chatbox_app/screens/home/home.dart';
import 'package:chatbox_app/screens/splash/splash_screen.dart';
import 'package:chatbox_app/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        // Consumer<AuthService>(
        //   builder: (context, auth, _) {
        //     return auth.user != null ? HomeScreen() : LoginScreen();
        //  },
        // ),
      ),
    );
  }
}

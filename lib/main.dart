import 'package:chatbox_app/firebase_options.dart';
import 'package:chatbox_app/screens/auth/log_in.dart';
import 'package:chatbox_app/screens/auth/sign_up.dart';
import 'package:chatbox_app/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Use your design size
      minTextAdapt: true,
      builder: (context, child) {
        return ChangeNotifierProvider(
          create: (_) => AuthService(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignUpScreen(), // or your initial screen
          ),
        );
      },
    );
  }
}

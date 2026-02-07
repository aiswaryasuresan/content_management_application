import 'package:content_management_app/ui/admin_dashboard_screen.dart';
import 'package:content_management_app/ui/auth/login_screen.dart';
import 'package:content_management_app/ui/auth/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        "/" : (context) => LoginScreen(),
        "/login" : (context) => LoginScreen(),
        "/signup" : (context) => SignUpScreen(),
        "/admindashboard" : (context) => AdminDashboardScreen(),
       // "/userdashboard" : (context) => UserDashboardScreen(),
      },
    );
  }
}

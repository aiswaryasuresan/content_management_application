import 'package:content_management_app/auth_service/auth_service.dart';
import 'package:content_management_app/ui/admin/admin_dashboard_screen.dart';
import 'package:content_management_app/ui/auth/login_screen.dart';
import 'package:content_management_app/ui/auth/sign_up_screen.dart';
import 'package:content_management_app/ui/user/user_dashboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        "/": (context) => CheckUserLoggedIn(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => SignUpScreen(),
        "/admindashboard": (context) => AdminDashboardScreen(),
        "/userdashboard": (context) => UserDashboardScreen(),
      },
    );
  }
}

class CheckUserLoggedIn extends StatefulWidget {
  const CheckUserLoggedIn({super.key});

  @override
  State<CheckUserLoggedIn> createState() => _CheckUserLoggedInState();
}

class _CheckUserLoggedInState extends State<CheckUserLoggedIn> {
  @override
  void initState() {
    super.initState();
    print("Is user logged : ${AuthService.isUserLoggedIn()}");

    Future.microtask(() {
      if (AuthService.isUserLoggedIn()) {
        if (AuthService.isAdmin()) {
          Navigator.pushReplacementNamed(context, "/admindashboard");
        } else {
          Navigator.pushReplacementNamed(context, "/userdashboard");
        }
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

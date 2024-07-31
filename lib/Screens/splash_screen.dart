import 'dart:developer';
import 'package:chatapp/Screens/auth/login_screen.dart';
import 'package:chatapp/Screens/home_screen.dart';
import 'package:chatapp/api/apis.dart';
import 'package:chatapp/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _LoginPageState();
}

class _LoginPageState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      );

      if (APIs.auth.currentUser != null) {
        log('\nUser:${FirebaseAuth.instance.currentUser}');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            width: mq.height * 0.3,
            top: mq.height * 0.15,
            right: mq.width * 0.25,
            child: Image.asset('images/chat.png'),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.90,
            width: MediaQuery.of(context).size.width,
            child: const Text(
              textAlign: TextAlign.center,
              "Developed by Abhishek Godara",
              style: TextStyle(fontSize: 15, letterSpacing: .5),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.60,
            width: MediaQuery.of(context).size.width,
            child: const Text(
              "Made in India With ❤️",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                  fontSize: 19),
            ),
          ),
        ],
      ),
    );
  }
}

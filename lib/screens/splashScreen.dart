import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_fashion/provider/LoginProvider.dart';
import 'package:trendy_fashion/provider/ProductProvider.dart';
import 'package:trendy_fashion/provider/SignupProvider.dart';
import 'package:trendy_fashion/provider/VerifyEmailProvider.dart';
import 'package:trendy_fashion/provider/WishlistProvider.dart';
import 'package:trendy_fashion/screens/homeScreen.dart';
import 'package:trendy_fashion/screens/welcomScreen.dart';
import 'package:trendy_fashion/widget/appWidget/parameterString.dart';
import 'package:trendy_fashion/widget/appWidget/sharedPreferances.dart';

import '../provider/CategoryProvider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(
            create: (context) => LoginProvider()),
        ChangeNotifierProvider<SignupProvider>(
            create: (context) => SignupProvider()),
        ChangeNotifierProvider<Verifyemailprovider>(
            create: (context) => Verifyemailprovider()),
        ChangeNotifierProvider<Categoryprovider>(
            create: (context) => Categoryprovider()),
        ChangeNotifierProvider<Productprovider>(
            create: (context) => Productprovider()),
        ChangeNotifierProvider<WishlistProvider>(
            create: (context) => WishlistProvider()),
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      navigationPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_bg.png'),
          ),
        ),
        child: Center(
          child: Container(
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> navigationPage() async {
    bool isFirstTime = await getPrefrenceBool(isLogin);
    if (isFirstTime) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homescreen(),
      ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => welcomeScreen(),
      ));
    }
  }
}

import 'dart:async';

import 'package:after_layout/after_layout.dart';

import 'package:cake_shop_on_boarding_ui/on_boarding_screen/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loadingSplash();
    super.initState();
  }

  loadingSplash() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navIntro);
  }

  navIntro() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const CheckOnBoarding()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFCF9),
        body: Padding(
          padding: const EdgeInsets.only(left: 38, right: 38),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/img_splash_screen.png'),
              const SizedBox(
                height: 21,
              ),
              Text(
                'Cake Shop',
                style: GoogleFonts.lora(
                    fontSize: 50,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                " \"Let's Make Your Life Sweet \" ",
                style: GoogleFonts.lora(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xff9C9C9C)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CheckOnBoarding extends StatefulWidget {
  const CheckOnBoarding({Key? key}) : super(key: key);

  @override
  _CheckOnBoardingState createState() => _CheckOnBoardingState();
}

class _CheckOnBoardingState extends State<CheckOnBoarding>
    with AfterLayoutMixin<CheckOnBoarding> {
  Future checkScreen() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool _looked = preferences.getBool('looked') ?? false;

    if (_looked) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              const OnBoardingScreen())); //Change HomePage() to OnBoardingScreen() for Repeat On Boarding Screen
    } else {
      await preferences.setBool('looked', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnBoardingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    checkScreen();
  }
}

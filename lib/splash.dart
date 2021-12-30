import 'dart:async';

import 'package:explore_lottie_flutter/pages/homepages.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _con;

  @override
  void initState() {
    _con = AnimationController(vsync: this);
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _con.dispose();
    super.dispose();
  }

  String splash = "Present Your Idea";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset("images/splash.json", onLoaded: (com) {
              _con
                ..duration = com.duration
                ..forward();
            }),
          ),
          Center(
            child: Text(
              splash,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Theme.of(context).textTheme.headline6!.fontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

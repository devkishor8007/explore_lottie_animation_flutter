import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lottiepy"),
      ),
      drawer: const Drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'images/guy.json',
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
          ElevatedButton.icon(
            onPressed: showDialogButton,
            icon: const Icon(Icons.delivery_dining),
            label: Text(
              "Order Now",
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

  void showDialogButton() => showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset('images/check.json', repeat: false,
                    onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                }),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.009,
                ),
                Text(
                  "Enjoy your Order",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Theme.of(context).textTheme.bodyText2!.fontSize,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.009,
                ),
              ],
            ),
          ));
}

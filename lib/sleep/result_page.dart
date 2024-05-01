import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: const Color.fromARGB(255, 13, 70, 117),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              // child: , //TODO Make
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              // child: , //TODO Make
            ),
          ],
        ),
      ),
    );
  }

  Widget getStartedButton() {
    return Container(
      alignment: Alignment.center,
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [
            Colors.yellow,
            Colors.yellow[900] ?? Colors.yellow,
          ],
        ),
      ),
      child: const Text(
        "Back to Home",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}

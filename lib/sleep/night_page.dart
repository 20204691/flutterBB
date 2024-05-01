import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projects/sleep/result_page.dart';

import '../core/prefs/prefs.dart';

class NightPage extends StatefulWidget {
  const NightPage({super.key});

  @override
  State<NightPage> createState() => _NightPageState();
}

class _NightPageState extends State<NightPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  String _currentTime = '';

  @override
  void initState() {
    updateTime();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void updateTime() {
    String formattedTime = DateFormat.Hm().format(DateTime.now());
    setState(() {
      _currentTime = formattedTime;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSwipeUp() {
    Prefs.saveWakeUpDateTime(DateTime.now());
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      backgroundColor: const Color.fromARGB(255, 5, 43, 74),
      body: SafeArea(
        child: SizedBox.expand(
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              _handleSwipeUp();

              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const ResultPage(),
                ),
              );
            },
            // onPanUpdate: (details) {
            //   if (details.delta.dy < 0) {
            //     print("UPUPUP");
            //   }
            // },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Good Morning !",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _currentTime,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Icon(
                          Icons.mood,
                          size: 150,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                    getStartedButton(),
                  ],
                ),
              ),
            ),
          ),
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
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 53, 139, 200),
            Color.fromARGB(255, 9, 37, 60),
          ],
        ),
      ),
      child: const Text(
        "Swip up to stop",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}

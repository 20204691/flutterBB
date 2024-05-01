import 'package:flutter/material.dart';

import '../core/prefs/prefs.dart';
import 'night_page.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    // _offsetAnimation = Tween<Offset>(
    //   begin: Offset.zero,
    //   end: const Offset(0.0, -1.0),
    // ).animate(CurvedAnimation(
    //   parent: _controller,
    //   curve: Curves.ease,
    // ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleSwipeUp() {
    Prefs.saveSleepDateTime(DateTime.now());
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              _handleSwipeUp();

              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const NightPage(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      DateTime.now().toString().substring(0, 19),
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "Good Morning !",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Icon(
                          Icons.sunny,
                          size: 150,
                          color: Colors.amber,
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
        gradient: LinearGradient(
          colors: [
            Colors.yellow,
            Colors.yellow[900] ?? Colors.yellow,
          ],
        ),
      ),
      child: const Text(
        "Swip up!",
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../sleep/sleep_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Home"),
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        backgroundColor: const Color.fromRGBO(94, 113, 183, 1),
      ),
      body: Container(
        color: const Color.fromRGBO(94, 113, 183, 1),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.white30,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_baseball,
                    size: 100,
                    color: Color.fromRGBO(94, 113, 183, 1),
                  ),
                  Text(
                    "bodyboost",
                    style: TextStyle(color: Color.fromRGBO(94, 113, 183, 1)),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox(height: 32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_drop,
                          color: Color.fromRGBO(94, 113, 183, 1),
                          size: 50,
                        ),
                        Text(
                          "Water",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(94, 113, 183, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.medical_services_rounded,
                          color: Color.fromRGBO(94, 113, 183, 1),
                          size: 50,
                        ),
                        Text(
                          "Medicine",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(94, 113, 183, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.restaurant_rounded,
                          color: Color.fromRGBO(94, 113, 183, 1),
                          size: 50,
                        ),
                        Text(
                          "Food",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(94, 113, 183, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SleepPage(),
                        ),
                      );
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wb_sunny_outlined,
                          color: Color.fromRGBO(94, 113, 183, 1),
                          size: 50,
                        ),
                        Text(
                          "Sleep",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(94, 113, 183, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'main/main_page.dart';

void main() {
  runApp(const MyBodyBoost());
}

class MyBodyBoost extends StatelessWidget {
  const MyBodyBoost({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

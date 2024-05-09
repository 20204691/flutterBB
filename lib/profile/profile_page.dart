import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Profile"),
        titleTextStyle: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white),
        backgroundColor: const Color.fromRGBO(94, 113, 183, 1),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 100,
            color: Colors.pink,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _firstNameController,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _lastNameController,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _ageController,
          ),
        ],
      ),
    );
  }
}

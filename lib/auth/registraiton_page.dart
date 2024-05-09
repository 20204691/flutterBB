import 'package:flutter/material.dart';
import 'package:projects/auth/verify_email_page.dart';
import 'package:projects/services/auth_service.dart';

import '../common/widgets/custom_text_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Register to get started with app",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  prefixIcon: const Icon(Icons.message),
                  backgroundColor: const Color.fromARGB(255, 216, 216, 216),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPassword,
                  controller: _passwordController,
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: showPassword
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                  backgroundColor: const Color.fromARGB(255, 216, 216, 216),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                    hintText: 'Confirm Password',
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: showConfirmPassword,
                    prefixIcon: const Icon(Icons.password),
                    backgroundColor: const Color.fromARGB(255, 216, 216, 216),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showConfirmPassword = !showConfirmPassword;
                        });
                      },
                      icon: showConfirmPassword
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    )),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () async {
                      var email = _emailController.text;
                      var password = _passwordController.text;
                      if (password == _confirmPasswordController.text) {
                        var response = await AuthService()
                            .registration(email: email, password: password);

                        if (response.contains('Success')) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const VerifyEmailPage(),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "REGISTER",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Login"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

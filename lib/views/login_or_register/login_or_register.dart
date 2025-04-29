import 'package:flutter/material.dart';
import 'package:guitar_codes_app/views/login_or_register/login_page.dart';
import 'package:guitar_codes_app/views/login_or_register/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: showLoginPage
            ? LoginPage(onTap: togglePages)
            : RegisterPage(onTap: togglePages),
      ),
    );
  }
}

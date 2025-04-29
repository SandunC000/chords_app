import 'package:flutter/material.dart';
import 'package:guitar_codes_app/services/auth_service.dart';
import 'package:guitar_codes_app/utilities/primary_button.dart';
import 'package:guitar_codes_app/utilities/primary_text_field.dart';
import 'package:guitar_codes_app/views/home/home_screen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void loginAsGuest(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.loginAsGuest();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Container(
                  decoration: ShapeDecoration(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context).colorScheme.inverseSurface
                        : null,
                    shape: const CircleBorder(),
                  ),
                  padding: EdgeInsets.zero,
                  child: const Center(
                    child: Image(
                      image: AssetImage('assets/app_logo.png'),
                      width: 300,
                      height: 300,
                    ),
                  ),
                ),
                PrimaryTextField(
                  controller: emailController,
                  labelText: "Email",
                  obsecureText: false,
                ),
                const SizedBox(height: 15),
                PrimaryTextField(
                  controller: passwordController,
                  labelText: "Password",
                  obsecureText: true,
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  text: "Sign In",
                  onTap: login,
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  text: "Login as Guest",
                  onTap: () => loginAsGuest(context),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:guitar_codes_app/services/auth_service.dart';
import 'package:guitar_codes_app/utilities/primary_button.dart';
import 'package:guitar_codes_app/utilities/primary_text_field.dart';
import 'package:guitar_codes_app/views/home/home_screen.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                Text(
                  "Let's Create an account for you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                const SizedBox(height: 15),
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
                PrimaryTextField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  obsecureText: true,
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  text: "Sign Up",
                  onTap: () {},
                ),
                const SizedBox(height: 15),
                PrimaryButton(
                  text: "Login as Guest",
                  onTap: () => loginAsGuest(context),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inverseSurface),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login Now',
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

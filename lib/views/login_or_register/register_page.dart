import 'package:flutter/material.dart';
import 'package:guitar_codes_app/utilities/primary_button.dart';
import 'package:guitar_codes_app/utilities/primary_text_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                    width: 250,
                    height: 250,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  "Let's Create an account for you",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.inverseSurface,
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
    );
  }
}

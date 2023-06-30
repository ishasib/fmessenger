import 'package:flutter/material.dart';
import 'package:fmessenger/components/my_button.dart';
import 'package:fmessenger/components/my_text_field.dart';
import 'package:fmessenger/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //sign in user
  Future<void> signIn() async {
    //get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.singnInWithEmailandPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                Icon(
                  Icons.message,
                  size: 80,
                  color: Colors.grey[800],
                ),
                const SizedBox(height: 50),

                //welcome back messege
                const Text(
                  "welcome back you have been missed!",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 25),

                //email text field
                MyTextField(
                    controller: emailController,
                    hintText: 'Email',
                    obscureText: false),
                const SizedBox(height: 25),
                //password text field
                MyTextField(
                    controller: passwordController,
                    hintText: 'password',
                    obscureText: true),
                const SizedBox(height: 25),

                //sing in button
                MyButton(onTap: signIn, text: "Sign In"),
                const SizedBox(height: 50),

                //not a member?register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo/screens/auth/signup_screen.dart';
import 'package:todo/services/auth_services.dart';
import 'package:todo/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          foregroundColor: CupertinoColors.white,
          title: const Text(
            'Sign In',
            style: TextStyle(color: CupertinoColors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Welcome! Back",
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "We' missed you",
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 45),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: CupertinoColors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Email',
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: CupertinoColors.black,
                      ),
                      hintStyle: const TextStyle(
                        color: Colors.white54,
                      ),
                      labelStyle: const TextStyle(color: CupertinoColors.black),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: CupertinoColors.black,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: 'Password',
                      prefixIcon: const Icon(
                        Icons.password_rounded,
                        color: CupertinoColors.black,
                      ),
                      labelStyle: const TextStyle(color: CupertinoColors.black),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Card(
                    elevation: 2,
                    shadowColor: CupertinoColors.black,
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: ElevatedButton(
                          onPressed: () async {
                            User? user = await _auth.signInWithEmailAndPassword(
                              _emailController.text,
                              _passwordController.text,
                            );

                            if (user != null) {
                              Navigator.push(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const HomeScreen(),
                                  ));
                            }
                          },
                          child: const Text(
                            'LogIn Now',
                            style: TextStyle(
                              fontSize: 18,
                              color: CupertinoColors.black,
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'OR',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignupScreen(),
                            ));
                      },
                      child: const Text(
                        "Don't have an account? Sign UP",
                        style: TextStyle(
                          color: CupertinoColors.black,
                        ),
                      )),
                  const SizedBox(height: 30),
                ],
              )),
        ),
      ),
    );
  }
}

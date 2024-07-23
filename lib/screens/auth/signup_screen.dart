import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/services/auth_services.dart';

class SignupScreen extends StatelessWidget {
  final AuthServices _auth = AuthServices();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1d2630),
      appBar: AppBar(
        backgroundColor: const Color(0xff1d2630),
        foregroundColor: CupertinoColors.white,
        title: const Text('Create Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 50),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.white54,
                          ))),
                )
              ],
            )),
      ),
    );
  }
}

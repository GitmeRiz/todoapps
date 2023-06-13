import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/pages/sidebar.dart';
import 'package:todoapp/widgets/buttonSignIn.dart';
import 'package:todoapp/widgets/myTextField.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  // text editing
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // user sign in
  void userSignIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // color of background
      backgroundColor: Theme.of(context).colorScheme.background,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),

                // image on login screen
                Image.asset(
                  'assets/images/LoginScreenLogo.png',
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 25,
                ),

                // text welcome
                Text("Welcome back, login to continue"),

                SizedBox(
                  height: 20,
                ),

                // username
                myTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                SizedBox(
                  height: 10,
                ),

                // password
                myTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                SizedBox(
                  height: 10,
                ),

                // forgot password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?"),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                buttonSignIn(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const sidebar()),
                    );
                  },
                ),

                //register
                SizedBox(height: 120),
                Divider(
                  thickness: 0.5,
                ),
                Text("Haven't register yet? Click here!")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/pages/sidebar.dart';
import 'package:todoapp/pages/welcomePage.dart';
import 'package:todoapp/widgets/buttonSignIn.dart';
import 'package:todoapp/widgets/myTextField.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

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
                  height: 100,
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
                Text("Welcome, click next to continue"),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("How to use app?"),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                        onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => welcomePage())),
                        child: Text("Click me!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue)))
                  ],
                ),

                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 100,
                ),
                buttonNext(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const sidebar()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

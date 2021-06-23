import 'package:flutter/material.dart';
import 'package:store_app/Utilities/Routes.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/signup.png",
                  height: 220,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 30),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    // fontFamily:
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Email", labelText: "Email"),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        obscureText: true,
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.signUpRoute);
                          },
                          child: Text(
                            "Sign up",
                          ),
                          style:
                              TextButton.styleFrom(minimumSize: Size(200, 40))),
                      SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Already have Account? Login",
                          ),
                          style: TextButton.styleFrom(
                              minimumSize: Size(200, 40),
                              backgroundColor: Colors.black))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

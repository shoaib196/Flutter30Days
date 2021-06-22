import 'package:flutter/material.dart';
import 'package:store_app/Utilities/Routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    String name = "";
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              height: 220,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 30),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                // fontFamily:
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter Email", labelText: "Email"),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                      print(name);
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Enter Password",
                        labelText: "Password"),
                    obscureText: true,
                  ),
                  SizedBox(height: 40),
                  Text(name),
                  // Container(
                  //   height: 40,
                  //   width: 150,
                  // ),

                  ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: Text(
                        "Login",
                      ),
                      style: TextButton.styleFrom(minimumSize: Size(200, 40))),
                  SizedBox(height: 40),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.signUpRoute);
                      },
                      child: Text(
                        "Don't have Account? SignUp",
                      ),
                      style: TextButton.styleFrom(
                          minimumSize: Size(200, 40),
                          backgroundColor: Colors.black))
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

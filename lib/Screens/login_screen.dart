import 'package:flutter/material.dart';
import 'package:store_app/Utilities/Routes.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changeButton = false;

  @override
  void initState() {
    changeButton = false;
    super.initState();
  }

  @protected
  @mustCallSuper
  void didPopNext(Route<dynamic> nextRoute) {
    setState(() {
      changeButton = false;
    });
  }

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
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: "Enter Email",
                            labelText: "Email"),
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
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

                      Material(
                        borderRadius: changeButton
                            ? BorderRadius.circular(30)
                            : BorderRadius.circular(8),
                        color: Colors.green,
                        child: InkWell(
                          mouseCursor: MouseCursor.defer,
                          focusColor: Colors.green,
                          onTap: () async {
                            setState(() {
                              changeButton = true;
                            });
                            await Future.delayed(Duration(milliseconds: 400));
                            Navigator.pushNamed(context, MyRoutes.homeRoute)
                                .then((value) {
                              setState(() {
                                changeButton = false;
                              });
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            height: changeButton ? 60 : 50,
                            width: changeButton ? 60 : 150,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(Icons.done,
                                    color: Colors.white, size: 30)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                            // decoration: BoxDecoration(
                            //   borderRadius: changeButton
                            //       ? BorderRadius.circular(30)
                            //       : BorderRadius.circular(8),
                            //   color: Colors.green,
                            // ),
                          ),
                        ),
                      ),

                      // ElevatedButton(
                      //     onPressed: () {
                      //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //     },
                      //     child: Text(
                      //       "Login",
                      //     ),
                      //     style: TextButton.styleFrom(minimumSize: Size(200, 40))),
                      SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.signUpRoute)
                                .then((value) {
                              setState(() {
                                name = value;
                                changeButton = false;
                              });
                            });
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
            ),
          ),
        ),
      ),
    );
  }
}

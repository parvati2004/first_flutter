import 'package:first_flutter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton=false;

  @override
  Widget build(BuildContext context) {
    final double imgWidth = math.min(
      280,
      MediaQuery.of(context).size.width * 0.25,
    );

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Logo/Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: SizedBox(
                width: imgWidth,
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Welcome Text  (const removed)
            Text(
              "Welcome $name",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Input Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "Enter username",
                      labelText: "Username",
                    ),
                     onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter password",
                      labelText: "Password",
                    ),
                   
                  ),
                  
                  const SizedBox(height: 40.0),

                  // Simple “Login” container (no navigation code kept)
                InkWell(
                  onTap:()async{
                    setState((){
                      changeButton=true;

                    });
                    await Future.delayed(Duration(seconds:1));
                   Navigator.pushNamed(context, MyRoutes.homeRoute);

                  },
                    child: AnimatedContainer(
                      duration:Duration(seconds:1) ,
                      width:changeButton?50: 150,
                      height: 40,
                     
                      alignment: Alignment.center,
                      child: changeButton?Icon(Icons.done,color:Colors.white): Text(
                        "login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize:22
                        ),
                      ),
                      decoration:BoxDecoration(
                         color: Colors.deepOrange,
                        //  shape:changeButton?BoxShape.circle:BoxShape.rectangle,
                        borderRadius:
                         BorderRadius.circular(changeButton?50:8),
                      ) ,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

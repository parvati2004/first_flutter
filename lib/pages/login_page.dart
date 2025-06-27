import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      //child:Center(
        // child:Text("Login Page",
        // style:TextStyle(
        //   fontSize:40,
        //   color:Colors.blue,
        //   fontWeight:FontWeight.bold,
        //),
        //),
        //),

        color:Colors.white,
        child:Column(
          children: [
            Image.asset("assets/images/login.png",fit:BoxFit.cover
            ),
            Text("Welcome",
            style:TextStyle(
              fontSize:22,
              fontWeight:FontWeight.bold,
            ),
            ),
          ],
        )
    );
  }
}
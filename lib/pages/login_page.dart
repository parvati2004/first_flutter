import 'package:flutter/material.dart';
import 'dart:math' as math;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Keep the image at most 280 px wide, and never more than 25 % of the window
    final double imgWidth = math.min(
      280,                               // hard upper‑limit
      MediaQuery.of(context).size.width * 0.25,
    );

    return Material(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: SizedBox(
              width: imgWidth,
              child: Image.asset(
                "assets/images/login.png",
                fit: BoxFit.contain,      // shrink to fit without distortion
              ),
            ),
          ),

          const Text(
            "Welcome",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter username",
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child:Text("Login"),
                  style:TextButton.styleFrom(),
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

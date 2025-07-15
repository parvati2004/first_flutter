import 'package:first_flutter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton=false;
  final _formKey=GlobalKey<FormState>();
  moveToHome(BuildContext context)async{
    if(_formKey.currentState!.validate())
    {

  
     setState((){
                          changeButton=true;
                    
                        });
                        await Future.delayed(Duration(seconds:1));
                        await context.vxNav.push(Uri.parse(MyRoutes.homeRoute));
                         setState((){
                          changeButton=false;
                    
                        });
  }
    }

  @override
  Widget build(BuildContext context) {
    final double imgWidth = math.min(
      280,
      MediaQuery.of(context).size.width * 0.25,
    );

    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child:Form(
          key:_formKey,
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
                      validator: (value){
                        if (value == null || value.isEmpty)
                        {
                          return "username cannot be empty";
                        }
                        return null;
                      },
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
                      validator: (value){
                      if (value == null || value.isEmpty)
                        {
                          return "password cannot be empty";
                        }
    
                        else if (value.length<6)
                        {
                          return "password length should be atleast 6";
                        }
                        return null;
                      },
                      
                     
                    ),
                    
                    const SizedBox(height: 40.0),
          
                    // Simple “Login” container (no navigation code kept)
                  Material(
                    color:Colors.deepPurple,
                      borderRadius:
                             BorderRadius.circular(changeButton?50:8),
                    child: InkWell(
                     onTap:()=>moveToHome(context),
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
                       
                       
                        ),
                      ),
                  ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

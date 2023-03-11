import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  login() async{
    UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();
    print("userCredentials $userCredential");
  }


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ()=>{
      login()
    }, child: Text("Login"));
  }
}
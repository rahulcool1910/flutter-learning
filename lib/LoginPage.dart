import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  void initState() {
    var x = 100;
  }

  void test() async {
    //   var data=await FirebaseAuth.instance
    //       .createUserWithEmailAndPassword(
    //           email: "test2@gmail.com", password: "12345678");
    // print("data $data");
    var data = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "test2@gmail.com", password: "12345678");
    print("data $data");
  }

  final _formKey = GlobalKey<FormState>();
  
  void onSubmit() async{
    var data = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: "test2@gmail.com", password: "12345678");
    print("data $data");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autocorrect: true,
            ),
            TextFormField(
              autocorrect: true,
            ),
            ElevatedButton(
                onPressed: () {
                  onSubmit();
                },
                child: Text("submit"))
          ],
        ));
    // ElevatedButton(
    //   onPressed: () => {test()},
    //   child: Text("Login Page"),
    // );
  }
}

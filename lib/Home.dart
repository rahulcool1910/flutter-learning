import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_clone/LoginScreen.dart';
import 'package:instagram_clone/Stories.dart';
import 'package:instagram_clone/Posts.dart';
import 'package:instagram_clone/LoginPage.dart';
import 'package:instagram_clone/utils/dimesions.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print("unauthenticated user");
        return;
      }
      print("users $user");
    });
    super.initState();
  }

void logout() async{
  await FirebaseAuth.instance.signOut();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              return SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (!snapshot.hasData) {
                      return LoginPage();
                    }

                    if (constraints.maxWidth >= webScreenWidth) {
                      return Text("webviews");
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ElevatedButton(onPressed: ()=>{logout()}, child: const Text("Logout")),
                        const Expanded(flex: 1, child: Stories()),
                        const SizedBox(
                          height: 10,
                        ),
                        const Expanded(
                          flex: 7,
                          child: Posts(),
                        ),
                      ],
                    );
                    // return LoginScreen();
                  },
                ),
              );
            }));
  }
}

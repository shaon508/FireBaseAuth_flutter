import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Pages/signin_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is home page"),
      ),
      body: Center(child: ElevatedButton(onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInPage()));
      }, child: Text("Log Out"))),
    );
  }
}

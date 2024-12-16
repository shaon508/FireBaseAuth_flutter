import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Pages/home_screen.dart';
import 'package:flutter_firebase/UserAuth/firebase_auth_services.dart';
import '../ReuseableWidget/reuseable_widget.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FireBaseAuthServices _auth = FireBaseAuthServices();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Sign Up page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            customTextField("Enter your email", Icons.person_2_outlined, false, emailController),
            SizedBox(height: 20,),
            customTextField("Enter your password", Icons.key_outlined, true, passwordController),
            SizedBox(height: 20,),
            customButton("Sign Up", (){
              signUpMethod();
            }),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
  void signUpMethod() async
  {
     String email = emailController.text;
     String password = passwordController.text;
     User? user = await _auth.singUpWithEmailAndPassword(email, password);
     if(user != null)
       {
         print("User is successfully created");
         Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
       }
     else
       {
         print("Some error occured!!");
       }
  }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Pages/signup_screen.dart';
import 'package:flutter_firebase/UserAuth/firebase_auth_services.dart';
import '../ReuseableWidget/reuseable_widget.dart';
import 'home_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Center(child: Text("Sign in page")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customTextField("Enter your email", Icons.person_2_outlined, false,
                emailController),
            SizedBox(
              height: 20,
            ),
            customTextField("Enter your password", Icons.key_outlined, true,
                passwordController),
            SizedBox(
              height: 20,
            ),
            customButton("Log in", () {
              signUpMethod();
            }),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?"),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpPage()));
                    },
                    child: Text("Sing Up")),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void signUpMethod() async
  {
    String email = emailController.text;
    String password = passwordController.text;
    User? user = await _auth.signInWithEmailAndPassword(email, password);
    if(user != null)
    {
      print("User is successfully sign in");
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }
    else
    {
      print("Some error occured!!");
    }
  }
}


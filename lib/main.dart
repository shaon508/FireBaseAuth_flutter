import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Pages/signin_screen.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb)
    {
      await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyAYIqdtXG5xWv43aopBFHSV7Ss1pfNSuPQ", appId: "1:136174339924:web:ce4333163897729f6e6ac1", messagingSenderId: "136174339924", projectId: "flutter-firebase-8e3e9"));
    }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home:  SignInPage(),
    );
  }
}

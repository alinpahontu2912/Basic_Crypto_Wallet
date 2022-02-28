import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_crypto/ui/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCEQwrtRRVTkOVR3bRzUmDqMiQSCcdwMPU',
          appId: '1:209596989185:android:092c123a25bd578d5ba500',
          messagingSenderId:
              '209596989185-6cf9jaqv19256edos7b06usr5j2b04cj.apps.googleusercontent.com',
          projectId: 'test-best-44caa'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Authentication(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}

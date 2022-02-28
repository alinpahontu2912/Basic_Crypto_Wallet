import 'package:flutter/material.dart';
import 'package:test_crypto/ui/homeview.dart';
import '../net/flutterfire.dart';

class Authentication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 45,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextFormField(
                controller: _emailField,
                decoration: const InputDecoration(
                  hintText: 'your@email.com',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  labelText: 'Email address',
                  labelStyle: TextStyle(
                      color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: TextFormField(
                  controller: _passwordField,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'your strong password',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    labelText: 'password',
                    labelStyle: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              height: 45,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purpleAccent),
              child: MaterialButton(
                onPressed: () async {
                  bool canNavigate =
                      await register(_emailField.text, _passwordField.text);
                  if (canNavigate) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  }
                },
                child: Text('Register'),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 5,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.purpleAccent),
              child: MaterialButton(
                onPressed: () async {
                  bool canNavigate =
                      await signIn(_emailField.text, _passwordField.text);
                  if (canNavigate) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeView()));
                  }
                },
                child: Text('Login'),
              ),
            ),
            const SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}

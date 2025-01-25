import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfinanceassistant/screens/homepage.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    var useName;
    var password;


    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Username'),
              ),
              onChanged: (value) {
                useName = value;
              },
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Password'),
              ),
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () async {
                try {
                  // ignore: unused_local_variable
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: useName, password: password);
                  if (FirebaseAuth.instance.currentUser != null) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homepage(),
                        ));
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

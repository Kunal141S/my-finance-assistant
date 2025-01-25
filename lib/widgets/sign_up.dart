import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/homepage.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    late String userName;
    late String password;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 40),
            Text('Sign Up Page'),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Username'),
              ),
              onChanged: (value) {
                userName = value;
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
            ElevatedButton(
              onPressed: () async {
                try {
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: userName,
                    password: password,
                  );
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .set({
                    'userId': FirebaseAuth.instance.currentUser!.uid,
                    'balance':0,
                    'email': null,
                    'creationTime': DateTime.now().toString(),
                    'name': null,
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('Success'),
                      content: Text('User created successfully'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

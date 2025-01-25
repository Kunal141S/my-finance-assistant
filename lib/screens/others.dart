import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:myfinanceassistant/screens/auth.dart';

class Others extends StatelessWidget {
  const Others({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser?.email;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: CircleAvatar(
                radius: 50,
                child: Text('profile'),
              ),
            ),
          ),
          Text('Email: $currentUser'),

          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              if (FirebaseAuth.instance.currentUser == null) {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Auth(),
                  ),
                );
              }
            },
            child: Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}

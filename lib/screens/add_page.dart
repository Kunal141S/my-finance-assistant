import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userId = FirebaseAuth.instance.currentUser!.uid;
    });
  }

  late int _money;
  int _balance = 0;
  var userId;
  String db = 'FirebaseFirestore.instance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 25.0,
            ),
            child: Text(
              'ADD',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Text('$_balance'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(fontSize: 30),
              onChanged: (value) {
                setState(() {
                  _money = int.parse(value);
                });
              },
            ),
          ),
          TextButton(
            onPressed: () {

            },
            child: Text('ADD'),
          ),
        ],
      ),
    );
  }
}

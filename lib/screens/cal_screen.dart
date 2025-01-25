import 'package:myfinanceassistant/widgets/cal.dart';
import 'package:flutter/material.dart';

class CalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_backspace),),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          CalendarWidget(),
        ],
      ),
    ));
  }
}

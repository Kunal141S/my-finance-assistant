import 'package:flutter/material.dart';
import 'package:myfinanceassistant/screens/income.dart';
import 'package:myfinanceassistant/screens/Expense.dart';

class Analysis extends StatefulWidget {
  const Analysis({super.key});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  int _selectedIndex = 0;
  List<Widget> myBody = [
    Income(),
    Expense(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: ({index = 0}) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Text('Income'),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: ElevatedButton(
                  onPressed: ({index = 1}) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Text('Expenses'),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: myBody[_selectedIndex],
      ),
    );
  }
}

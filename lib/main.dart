import 'package:dummy_app1/input_screen.dart';
import 'package:dummy_app1/results_page.dart';
import 'package:flutter/material.dart';

void main()=>runApp(BMICalculator());

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      home:InputScreen(),
      routes: {//CREATING A ROUTES TABLE FOR THE PAGES (KEY VALUE PAIR)
        ResultsPage.routeName: (ctx)=>ResultsPage(),
      },
    );
  }
}

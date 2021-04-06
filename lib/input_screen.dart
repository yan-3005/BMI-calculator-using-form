import 'package:dummy_app1/results_page.dart';
import 'package:flutter/material.dart';
import 'dart:math'; //TO USE POWER FUNCTION TO CALCULATE BMI

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final _formKey = GlobalKey<FormState>(); //UNIQUE KEY FOR THE FORM
  double _height;
  double _weight;
  var message;
  double _bmi;

  String getMessage(_bmi) {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

//SUBMITTING AND SAVING THE VALUES
  void _trySubmit() {
    final isValid = _formKey.currentState.validate();//validates all the formfields
    if(!isValid)
      {
        return;
      }
    _formKey.currentState.save();//saves all the form fields
    FocusScope.of(context).unfocus(); //TO UNFOCUS THE CURSOR
    _bmi = _weight / pow(_height * 0.01, 2);
    Navigator.of(context).pushNamed(
      ResultsPage.routeName,
      arguments: {
        'message': getMessage(_bmi),
        'bmi': _bmi,
      },
    );//NAVIGATING TO THE NEXT PAGE FOR THE RESULTS USING NAMED ROUTE.RESULTS PAGE NEEDS ARGUMENTS SUCH AS BMI TO DISPLAY, SO WE PASS USING ARGUMENTS KEY
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(10),
          child: Form(
            key: _formKey,//ASSIGNING THE DECLARED KEY TO THE FORM
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  //key: ValueKey('height'),
                  decoration: InputDecoration(labelText: ' Height'),
                  onSaved: (value) {
                    _height = double.parse(value);//ASSIGNING THE VALUE ENTERED TO HEIGHT
                  },
                  validator: (value) {//VALIDATING FOR ERRORS
                    if (value.isEmpty||value==null) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,//SETTING THE KEYBOARD TYPE AS NUMBER KEYPAD

                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  //key: ValueKey('weight'),
                  decoration: InputDecoration(labelText: ' Weight'),
                  validator: (value) {
                    if (value.isEmpty||value==null) {
                      return 'Please enter a value';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  onSaved: (value) {
                    _weight = double.parse(value);
                  },
                ),
                RaisedButton(child: Text('Calculate'), onPressed: _trySubmit),//CALCULATING THE BMI BY CALLING TRY SUBMIT FUNCTION
              ],
            ),
          ),
        ),
      ),
    );
  }
}

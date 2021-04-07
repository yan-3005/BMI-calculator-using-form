//import 'package:dummy_app1/button.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {
  static const routeName = '/results-page'; //FOR STORING THE ROUTE NAME KEY

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,
        Object>; //FETCHING THE ARGUMENTS PASSED AS MAP FROM THE INPUT PAGE
    double bmi = routeArgs['bmi']; //MAP IS USED SO WE USE ['KEY']
    final message = routeArgs['message'];

    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text('BMI Scores'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        color: Colors.blue,
        child: Center(
          child: Card(
            //margin: EdgeInsets.all(5),
            //color: Colors.blue[500],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'BMI VALUE',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                //SizedBox(height: 10,),
                Text(
                  bmi.toStringAsFixed(1),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                //SizedBox(height: 10),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                //SizedBox(height: 10,),
                Card(
                  margin: EdgeInsets.all(40),
                  child: RaisedButton(
                    child: Text('RE-CALCULATE'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.yellow,
                  ),
                ),
                // Card(
                //   margin: EdgeInsets.all(20),
                //   child: BottomButton(
                //       onTap: () {
                //         //OUR CUSTOMISED BUTTON IS CALLED BY PASSING THE REQUIRED PARAMETERS.
                //         Navigator.pop(
                //             context); //POPPING THIS PAGE AND MOVING TO THE INPUT PAGE
                //       },
                //       buttonTitle: 'Re-Calculate'),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

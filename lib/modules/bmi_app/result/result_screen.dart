import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultBmi extends StatelessWidget {
late final String gender;
late final int height;
late final int weight;
late final int age;
late final int result;

ResultBmi({
  required this.gender,
  required this.height,
  required this.weight,
  required this.age,
  required this.result,

});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gender :',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '$gender',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Height :',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '$height',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Weight :',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '$weight',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'age :',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '$age',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Result :',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '$result',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}

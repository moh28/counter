import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final bool isMale;
  final int result;
  final int age;

  BmiResultScreen({
      required this.isMale, required this.age, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI RESULT'),
        leading:IconButton(icon: Icon(Icons.keyboard_arrow_left),onPressed: (){
          Navigator.pop(context);
        },) ,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Text(
              'Gender: ${isMale?'Male':'Female'}',
              style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text('Result: $result',
                style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
            Text('Age: $age',
                style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

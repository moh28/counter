import 'dart:math';
import 'package:first/modules/bmi_result/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class Calculater extends StatefulWidget {

  @override
  State<Calculater> createState() => _CalculaterState();
}

class _CalculaterState extends State<Calculater> {
  bool isMale=true;
  double height=120.0;
  int weight=40;
  int age=16;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATER')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:isMale? Colors.blue :Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(image: AssetImage('assets/images/1608532_male_icon.png'),height: 90.0,width: 90.0,),
                            SizedBox(height: 15.0,),
                            Text(
                              'Male',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(

                        decoration: BoxDecoration(

                            color: !isMale ? Colors.blue:Colors.grey,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Image(image: AssetImage('assets/images/symbol-of-woman-icon-13306.png'),height: 90.0,width: 90.0,),
                            SizedBox(height: 15.0,),
                            Text(
                              'Female',
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20.0,),
                  const Text(
                    'HEIGHT',
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  [
                      Text(
                        '${height.round()}',
                        style: const TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Text(
                        'CM',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    max: 220,
                    min: 80,
                    onChanged: (value) {
                     setState(() {
                       height=value;
                     });
                    },
                  ),
                  const SizedBox(height: 40.0,)
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey, borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text(
                            'AGE',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                           Text(
                            '$age',
                            style: const TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'age-',
                                onPressed:(){
                                setState(() {
                                  age--;
                                });
                              } ,mini: true,child: const Icon(Icons.remove),),
                              FloatingActionButton(
                                heroTag: 'age+',
                                onPressed:(){
                                setState(() {
                                  age++;
                                });
                              } ,mini: true,child: const Icon(Icons.add),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(

                      decoration: BoxDecoration(
                          color: Colors.grey, borderRadius: BorderRadius.circular(10.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                                fontSize: 40.0, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: 'weight-',
                                onPressed:(){
                                setState(() {
                                  weight--;
                                });
                              } ,mini: true,child: const Icon(Icons.remove),),
                              FloatingActionButton(
                                heroTag: 'weight+',
                                onPressed:(){
                                setState(() {
                                  weight++;
                                });
                              } ,mini: true,child: const Icon(Icons.add),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 50.0,
            child: MaterialButton(
              onPressed: () {
                double result =weight/pow(height/100, 2);
                print(result.round());
                Navigator.push(context, MaterialPageRoute(builder: (context) =>BmiResultScreen(age: age,
                  isMale: isMale,
                  result: result.round(),

                )));

              },
              child: const Text('calculate'),
            ),
          )
        ],
      ),
    );
  }
}

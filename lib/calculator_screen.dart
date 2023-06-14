import 'dart:math';

import 'package:flutter/material.dart';

import 'result_screen.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  bool isMale=true;
  int weight=40;
  int age=20;
  double height=120.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color:isMale?Colors.blue : Colors.grey[400],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/boy.png',width: 70,height: 70,),
                            const SizedBox(height: 20,),
                            const Text('MALE'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          isMale=false;
                        });
                      },
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color:isMale? Colors.grey[400]:Colors.blue,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/girl.png',width: 70,height: 70,),
                            const SizedBox(height: 20,),
                            const Text('FEMALE'),
                          ],
                        ),
                      ),
                    ),),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT',style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text('${height.round()}',style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w900,
                        ),),
                        const Text('cm',style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        ),

                      ],
                    ),
                    Slider(value: height,
                      max: 220.0,
                      min: 80.0,
                      onChanged: (value){
                      setState(() {
                        height=value;
                      });
                      },),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT',style: TextStyle(
                            fontSize: 19,
                          )),
                          Text('$weight',style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w900,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                mini: true,child: const Icon(Icons.remove),),
                              const SizedBox(width: 10,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },mini: true,child: const Icon(Icons.add),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: Container(
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('AGE',style: TextStyle(
                            fontSize: 19,
                          )),
                          Text('$age',style: const TextStyle(
                            fontSize: 27,
                            fontWeight: FontWeight.w900,)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                                mini: true,child: const Icon(Icons.remove),),
                              const SizedBox(width: 10,),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },mini: true,child: const Icon(Icons.add),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              height:50,
              child: ElevatedButton(
                  onPressed: (){
                    var result=weight /pow(height /100, 2);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(
                      age: age, result: result.round(), isMale: isMale,)));
                  }, child: const Text('Calculate'))),
        ],
      ),
    );
  }
}

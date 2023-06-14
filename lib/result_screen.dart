import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
 final bool isMale;
 final int result;
 final int age;
  const ResultScreen({super.key,  required this.age,required this.isMale,required this.result});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale ?'Male':'Female'}',
              style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),),
            Text('Result : $result',
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
            Text('Age : $age',
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),),
          ],
        ),
      )
    );
  }
}

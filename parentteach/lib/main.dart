import 'package:flutter/material.dart';
import 'screen/solution_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ParentTeach',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SolutionScreen(),
    );
  }
}

import 'package:flutter/material.dart';

class Conform extends StatelessWidget {
  final String parameter;
  Conform({required this.parameter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
              'received data is : $parameter'
          ),
        ),
      ),
    );
  }
}
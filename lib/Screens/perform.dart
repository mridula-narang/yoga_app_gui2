import 'package:flutter/material.dart';

class Perform extends StatelessWidget {
  const Perform({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perform Asana'),
      ),
      body: Text('Hello World!',
      style: TextStyle(
        fontSize: 20,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
      ),
      ),
    );
  }
}
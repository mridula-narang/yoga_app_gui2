// instructions_page.dart
import 'package:flutter/material.dart';

class InstructionsPage extends StatelessWidget {
  final String assetPath;
  final String instructions;

  InstructionsPage({required this.assetPath, required this.instructions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
      ),
      body: Column(
        children: [
          // Image(
          //   image: AssetImage(assetPath),
          // ),
          Text(instructions),
        ],
      ),
    );
  }
}

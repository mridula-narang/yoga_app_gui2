import 'package:flutter/material.dart';
import 'package:yoga_app_gui2/Screens/perform.dart';
class InstructionsPage extends StatelessWidget {
  final String assetPath;
  final String instructions;
  final List<String> imagePaths; // List of image paths

  InstructionsPage({required this.assetPath, required this.instructions, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instructions'),
      ),
      body: Column(
        children: [
          Text(instructions),
          SizedBox(height: 5), // Reduce the gap between text and images

          Container(
            height: 200, // Set the desired height for the image
            child: Image(
              image: AssetImage(assetPath), // Use the received assetPath
            ),
          ),

          SizedBox(height: 10), // Add spacing between the text and the image

          // Display multiple images using a ListView
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical, // Scroll horizontally
              children: imagePaths
                  .map((path) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(image: AssetImage(path)),
                      ))
                  .toList(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Perform(),
                  ),
                );
              },
              child: Text('Get Started'),
            ),
        ],
      ),
    );
  }
}

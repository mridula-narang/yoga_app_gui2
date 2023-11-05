import 'package:flutter/material.dart';
import 'package:yoga_app_gui2/Screens/instructions.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yoga Monitoring system'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width, // Set the width to the screen width
                child: Card(
                  child: Image(
                    image: AssetImage('assets/tree1.jpg'),
                    fit: BoxFit.cover, // Make the image cover the card
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Vrikshasana',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.dotted,
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InstructionsPage(
                        assetPath: 'assets/tree1.jpg',
                        instructions: 'These are the instructions for vrikshasana.',
                        imagePaths: [
                          'assets/tree2.jpg',
                          'assets/tree3.jpg',
                        ],
                      ),
                    ),
                  );
                },
                child: Text('View Instructions for vrikshasana'),
              ),

              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width, // Set the width to the screen width
                child: Card(
                  child: Image(
                    image: AssetImage('assets/asana2.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Sheersasana',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.dotted,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InstructionsPage(
                        assetPath: 'assets/asana2.jpeg',
                        instructions: 'These are the instructions for Sheersasana.',
                        imagePaths: [
                          'assets/asana2_s1.jpg',
                          'assets/asana2_s2.jpg',
                          'assets/asana2_s3.jpg',
                          'assets/asana2_s4.jpg',
                          'assets/asana2_s5.jpg',
                          'assets/asana2_s6.jpg',
                          'assets/asana2_s7.jpg',
                        ],
                      ),
                    ),
                  );
                },
                child: Text('View Instructions for Sheersasana'),
              ),

              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width, // Set the width to the screen width
                child: Card(
                  child: Image(
                    image: AssetImage('assets/asana3.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Sukhasana',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.red,
                  decorationStyle: TextDecorationStyle.dotted,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/instructions',
                    arguments: {
                      'assetPath': 'assets/asana3.jpeg',
                      'instructions': 'These are the instructions for Sukhasana.',
                    },
                  );
                },
                child: Text('View Instructions for Sukhasana'),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

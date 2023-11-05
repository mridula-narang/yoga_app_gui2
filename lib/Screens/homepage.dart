import 'package:flutter/material.dart';

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
        title: Text('Yoga Monitoring system')
        ),
      //make a scrollable element inside the body so that i can put multiple cards
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                child: Card(
                  child: Image(
                    image: AssetImage('assets/tree1.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text('Vrikshasana',
              style: TextStyle(
                fontSize: 20,  // Font size
                color: Colors.blue,  // Text color
                fontWeight: FontWeight.bold,  // Text weight
                fontStyle: FontStyle.italic,  // Text style (italic)
                decoration: TextDecoration.underline,  // Text decoration (underline)
                decorationColor: Colors.red,  // Decoration color
                decorationStyle: TextDecorationStyle.dotted,  // Decoration style
              ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/instructions',
                    arguments: {
                      'assetPath': 'assets/tree1.jpg',
                      'instructions': 'These are the instructions for Vrikshasana.',
                    },
                  );
                },
                child: Text('View Instructions for Vrikshasana'),
              ),

              Container(
                height: 200,
                child: Card(
                  child: Image(
                    image: AssetImage('assets/asana2.jpeg'),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text('Sheersasana',
              style: TextStyle(
                fontSize: 20,  // Font size
                color: Colors.blue,  // Text color
                fontWeight: FontWeight.bold,  // Text weight
                fontStyle: FontStyle.italic,  // Text style (italic)
                decoration: TextDecoration.underline,  // Text decoration (underline)
                decorationColor: Colors.red,  // Decoration color
                decorationStyle: TextDecorationStyle.dotted,  // Decoration style
              ),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: Card(
                  child: Image(
                    image: AssetImage('assets/asana3.jpeg'),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text('Sukhasana',
              style: TextStyle(
                fontSize: 20,  // Font size
                color: Colors.blue,  // Text color
                fontWeight: FontWeight.bold,  // Text weight
                fontStyle: FontStyle.italic,  // Text style (italic)
                decoration: TextDecoration.underline,  // Text decoration (underline)
                decorationColor: Colors.red,  // Decoration color
                decorationStyle: TextDecorationStyle.dotted,  // Decoration style
              ),
              ),
              SizedBox(height: 10),
            ]
          ),
        // body: Card(
        // child: Image(
        //   image: AssetImage('assets/tree1.jpg'),
        // ),
        // ),
          ),
      ),
    );
  }
}
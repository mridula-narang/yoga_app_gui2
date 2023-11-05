import 'package:flutter/material.dart';
import 'package:yoga_app_gui2/Screens/homepage.dart';
import 'package:yoga_app_gui2/Screens/instructions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter swipable animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/instructions': (context) {
          final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
          final assetPath = arguments['assetPath'] ?? ''; // Use the null-aware operator (??) to provide a default empty string if it's null
          final instructions = arguments['instructions'] ?? ''; // Use the null-aware operator (??) to provide a default empty string if it's null

          return InstructionsPage(
            assetPath: assetPath,
            instructions: instructions, 
            imagePaths: [],
          );
        },


      }
    );
  }
}



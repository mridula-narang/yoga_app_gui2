import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Perform extends StatefulWidget {
  const Perform({Key? key}) : super(key: key);

  @override
  _PerformState createState() => _PerformState();
}

class _PerformState extends State<Perform> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/your_video.mp4', // Replace with the actual path to your video in the assets folder
    )..initialize().then((_) {
      setState(() {});
    });

    // Listen for video completion
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        // Handle video completion if needed
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perform Asana'),
      ),
      body: Column(
        children: [
          Text(
            'Step 1',
            style: TextStyle(
              fontSize: 20,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          SizedBox(height: 5),
          ElevatedButton(
            onPressed: () {
              _videoPlayerController.play();
            },
            child: Text('See video'),
          ),
          SizedBox(height: 5),
          Container(
            height: 200, // Set a specific height for the ListView
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.asset(
                  'assets/vs1i.jpg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/vs1f.jpg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          _videoPlayerController.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _videoPlayerController.value.aspectRatio,
                  child: VideoPlayer(_videoPlayerController),
                )
              : CircularProgressIndicator(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yoga_app_gui2/Screens/step_two.dart';

class Perform extends StatefulWidget {
  const Perform({Key? key}) : super(key: key);

  @override
  _PerformState createState() => _PerformState();
}

class _PerformState extends State<Perform> {
  late VideoPlayerController _videoPlayerController;
  bool isVideoVisible = false;
  bool isVideoCompleted = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/step1.mp4', // Replace with the actual path to your video in the assets folder
    )..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
      });

    // Listen for video completion
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        setState(() {
          isVideoCompleted = true;
        });
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
      body: Stack(
        children: [
          Column(
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
              Expanded(
                child: isVideoVisible
                    ? Container() // Empty container when video is visible to take up space
                    : ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        Card(
                          child: Image(
                            image: AssetImage('assets/vs1i.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Card(
                          child: Image(
                            image: AssetImage('assets/vs1f.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ]
                    ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVideoVisible = !isVideoVisible;
                    if (isVideoVisible) {
                      _videoPlayerController.play();
                    } else {
                      _videoPlayerController.pause();
                    }
                  });
                },
                child: Text('See video'),
              ),
            ],
          ),
          Visibility(
            visible: isVideoVisible,
            child: Center(
              child: _videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: Stack(
                        children: [
                          VideoPlayer(_videoPlayerController),
                          if (isVideoCompleted)
                            Positioned(
                              bottom: 20,
                              right: 20,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NextStep(),
                                      ),
                                    );
                                },
                                child: Text('Next Step'),
                              ),
                            ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}

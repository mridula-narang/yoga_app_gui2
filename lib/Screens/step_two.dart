import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yoga_app_gui2/Screens/final_step.dart';
// import 'package:yoga_app_gui2/Screens/perform.dart';

class NextStep extends StatefulWidget {
  const NextStep({super.key});

  @override
  State<NextStep> createState() => _NextStepState();
}

class _NextStepState extends State<NextStep> {
  late VideoPlayerController _videoPlayerController;
  bool isVideoVisible = false;
  bool isVideoCompleted = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/step2.mp4', // Replace with the actual path to your video in the assets folder
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
        title: const Text('Step 2'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Step 2',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 5),
                isVideoVisible
                    ? Container() // Empty container when video is visible to take up space
                    : Card(
                        child: Image(
                          image: AssetImage('assets/vs2f.jpg'),
                          fit: BoxFit.cover,
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
                Visibility(
                  visible: isVideoVisible,
                  child: Center(
                    child: _videoPlayerController.value.isInitialized
                        ? AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
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
                                            builder: (context) => FinalStep(),
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
          ),
        ],
      ),
    );
  }
}

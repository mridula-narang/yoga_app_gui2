import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:yoga_app_gui2/Screens/homepage.dart';

class FinalStep extends StatefulWidget {
  const FinalStep({super.key});

  @override
  State<FinalStep> createState() => _FinalStepState();
}

class _FinalStepState extends State<FinalStep> {
  late VideoPlayerController _videoPlayerController;
  bool isVideoVisible = false;
  bool isVideoCompleted = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/step3.mp4', // Replace with the actual path to your video in the assets folder
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
        title: const Text('Final step'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Step 3. This is the final step',
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
                          image: AssetImage('assets/vs3f.jpg'),
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
                                            builder: (context) => HomePage(),
                                          ),
                                        );
                                      },
                                      child: Text('Go to Home page'),
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

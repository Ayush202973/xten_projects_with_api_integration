import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ISSVideo extends StatefulWidget {
  const ISSVideo({super.key});

  @override
  State<ISSVideo> createState() => _ISSVideoState();
}

class _ISSVideoState extends State<ISSVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String videoId = 'BywoLxuBgT0'; // Manually extracted video ID from URL

    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
        ),
      ),
    );
  }
}

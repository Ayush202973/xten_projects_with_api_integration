import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class GodOfDeepVideo extends StatefulWidget {
  const GodOfDeepVideo({super.key});

  @override
  State<GodOfDeepVideo> createState() => _GodOfDeepVideoState();
}

class _GodOfDeepVideoState extends State<GodOfDeepVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String videoId = 'UShRUzUpDt0'; // Manually extracted video ID from URL

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

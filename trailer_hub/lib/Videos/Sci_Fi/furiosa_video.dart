import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FuriosaVideo extends StatefulWidget {
  const FuriosaVideo({super.key});

  @override
  State<FuriosaVideo> createState() => _FuriosaVideoState();
}

class _FuriosaVideoState extends State<FuriosaVideo> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String videoId = 'XJMuhwVlca4'; // Manually extracted video ID from URL

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

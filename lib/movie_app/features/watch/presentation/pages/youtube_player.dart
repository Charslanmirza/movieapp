import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';

class YoutubeVideo extends StatefulWidget {
  final String youtubeUrl;

  YoutubeVideo(this.youtubeUrl);

  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  bool _isPlayerReady = false;
  late String videoId;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        showLiveFullscreenButton: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {});
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to the next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: 200,
        color: Colors.blue,
        child: VisibilityDetector(
          key: const Key("unique key"),
          onVisibilityChanged: (info) {
            if (info.visibleFraction == 0) {
              _controller.pause();
            } else {
              _controller.value.isPlaying
                  ? _controller.play()
                  : _controller.pause();
            }
          },
          child: YoutubePlayerBuilder(
            onExitFullScreen: () {
              // The player forces portraitUp after exiting fullscreen. This overrides the behavior.
              SystemChrome.setPreferredOrientations(DeviceOrientation.values);
            },
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              topActions: <Widget>[
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    _controller.metadata.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
              onReady: () {
                _controller.addListener(listener);
                _controller.toggleFullScreenMode(); // Automatically enter full-screen mode
              },
              onEnded: (data) {
                // Video playback completed
                Get.back(); // Navigate back
              },
            ),
            builder: (context, player) => Scaffold(
              body: ListView(
                children: [
                  player,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

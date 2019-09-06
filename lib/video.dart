import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class AIVideoPlayer extends StatefulWidget {
  var url,title;
  AIVideoPlayer(url,title){
    this.url = url;
    this.title = title;
  }
  @override
  _AIVideoPlayerState createState() => _AIVideoPlayerState();
}

class _AIVideoPlayerState extends State<AIVideoPlayer> {
  VideoPlayerController _controller;
  var w;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        _controller.setVolume(1);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    /* if (initialized) {
      final Size size = _controller.value.size;
      w= MediaQuery.of(context).size;
      return SizedBox(width:100.0,child:AspectRatio(
        aspectRatio: size.width / size.height,
        child: VideoPlayer(_controller),
      ));
    } else {
      return new Container(color: Colors.blueAccent,child: Center(child:new Text('loading')),);
    }*/
    return MaterialApp(
      title: widget.title,
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(child:Center(child:new Text('loading'))),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
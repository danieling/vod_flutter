import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});
  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  bool _isPlaying = true;
  final VlcPlayerController _vlcPlayerController = VlcPlayerController.network(
    'https://0r0muqzr7.sw-cdnstream.com/hls2/01/02422/ef3pac0xmvii_n/index-v1-a1.m3u8?t=V0RHTvEAiBh4K6-D9avqe0XwB7Cjas0FT-fg3-sx4OU&s=1701987506&e=129600&f=12269530&srv=tszfjzanyeke&i=0.4&sp=500&p1=tszfjzanyeke&p2=tszfjzanyeke&asn=6568',
    hwAcc: HwAcc.full,
    autoPlay: true,
    options: VlcPlayerOptions(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        VlcPlayer(
          controller: _vlcPlayerController,
          aspectRatio: 16 / 9,
          placeholder: const Center(
            child: CircularProgressIndicator(color: Colors.deepPurpleAccent),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.fast_rewind,
                  size: 28,
                  color: Colors.black,
                )),
            TextButton(
                onPressed: () {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _vlcPlayerController.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _vlcPlayerController.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause_circle : Icons.play_arrow,
                  size: 28,
                  color: Colors.black,
                )),
            TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.fast_forward,
                  size: 28,
                  color: Colors.black,
                )),
          ],
        )
      ]),
    );
  }
}

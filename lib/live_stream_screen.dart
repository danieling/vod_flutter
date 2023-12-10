import 'package:first_app/get_link_caliente.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';

class LiveStreamScreen extends StatefulWidget {
  const LiveStreamScreen({super.key});
  @override
  State<LiveStreamScreen> createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  bool _isPlaying = true;
  late VlcPlayerController _vlcPlayerController;

  _LiveStreamScreenState() {
    _vlcPlayerController = VlcPlayerController.network(
      'https://sc0ikg0x.sw-cdnstream.com/hls2/01/02450/don0c5wb1w3p_n/master.m3u8?t=swbSHsdNvlLQYzlkiUetMvGVJWuEylPvOr3v3qT7mYo&s=1702169205&e=129600&f=12394131&srv=vUVabH8vnOTA&i=0.4&sp=500&p1=vUVabH8vnOTA&p2=vUVabH8vnOTA&asn=6568',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }

//sacar esta logica a un antes para luego llamar a este widget ya con el hotlink
  // void _initialize() async {
  //   String flixxx =
  //       await getHotLink(Uri.parse('https://flaswish.com/s3wxj821o0cq'));
  // }

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

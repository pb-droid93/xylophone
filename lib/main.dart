import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XyloPhone());
}

class XyloPhone extends StatefulWidget {
  const XyloPhone({super.key});

  @override
  State<XyloPhone> createState() => _XyloPhone();
}

class _XyloPhone extends State<XyloPhone> {
  Future<void> playsound(int value) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$value.wav'));
  }

  Expanded buildKey(Color color, int soundNo) {
    return Expanded(
      child: Container(
        color: color,
        child: GestureDetector(
          onTap: () {
            playsound(soundNo);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XyloPhone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildKey(Colors.blue, 1),
                  buildKey(Colors.green, 2),
                  buildKey(Colors.yellow, 3),
                  buildKey(Colors.orange, 4),
                  buildKey(Colors.red, 5),
                  buildKey(Colors.pinkAccent, 6),
                  buildKey(Colors.purple, 7),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

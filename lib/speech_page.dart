import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'features/speech-conversion-module/domain/models/consts.dart';

class SpeechPage extends StatefulWidget {
  const SpeechPage({super.key});

  @override
  State<SpeechPage> createState() => _SpeechPageState();
}

class _SpeechPageState extends State<SpeechPage> {
  final FlutterTts _flutterTts = FlutterTts();

  List<Map> _voices = [];
  Map? _currentVoice;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTTS();
  }

  void initTTS() {
    _flutterTts.getVoices.then((data) {
      try {
        _voices = List<Map>.from(data);

        print(_voices);
        setState(() {
          _voices =
              _voices.where((voice) => voice["name"].contains("en")).toList();
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e.toString());
      }
    });
  }

  void setVoice(Map voice) {
    _flutterTts.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _flutterTts.speak(TTS_INPUT);
        },
        child: const Icon(Icons.speaker_phone),
      ),
    );
  }

  Widget buildUI() {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        speakerSelector(),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 20,
              color: Colors.black
            ),
            children: <TextSpan>[TextSpan(text: TTS_INPUT)]
          )
        )
      ],
    ));
  }

  Widget speakerSelector() {
    return DropdownButton(
        value: _currentVoice,
        items: _voices
            .map((voice) => DropdownMenuItem(
              value: voice,
              child: Text(voice["name"])
            ))
            .toList(),
        onChanged: (value) {
          
        });
  }
}

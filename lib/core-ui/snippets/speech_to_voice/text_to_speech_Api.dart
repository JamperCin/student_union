import 'package:core_module/core_module.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechApi {
  static TextToSpeechApi? _instance;
  final flutterTts = FlutterTts();
  RxBool isReadingAloud = false.obs;

  TextToSpeechApi._() {
     _init();
  }

  factory TextToSpeechApi() {
    return _instance ??= TextToSpeechApi._();
  }

  Future _init() async {
    await flutterTts.setLanguage("en-US");

    await flutterTts.setSpeechRate(0.4); //speed

    await flutterTts.setVolume(1.0);

    await flutterTts.setPitch(1.0);
  }

  Future<void> regulateSpeech(String text, {double speed = 0.4}) async {
    isReadingAloud.value = !isReadingAloud.value;
    if(isReadingAloud.value) {
      await speak(text, speed: speed);
    } else {
      stop();
    }
  }

  Future<void> speak(String text,{double speed = 0.4}) async {
    if(text.isEmpty) {
      isReadingAloud.value = false;
      return;
    }

    await flutterTts.setSpeechRate(speed); //speed
    await flutterTts.speak(text);
    isReadingAloud.value = true;
    flutterTts.setCompletionHandler(() {
      stop();
    });
  }

  Future<void> stop() async {
    await flutterTts.stop();
    isReadingAloud.value = false;
  }

}

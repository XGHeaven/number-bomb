import 'dart:html';

import 'package:number_bomb/src/contant.dart';

final audioCache = new Map<int, AudioElement>();

playAudio(int index) {
  if (index >= AUDIOS.length) {
    return;
  }
  var audio = audioCache[index];
  if (audio == null) {
    print('create new');
    audio = new AudioElement(AUDIOS.toList()[index]);
  }
  audioCache[index] = audio;
  audio.pause();
  audio.currentTime = 0;
  audio.play();
}

playBombing() {
  playAudio(0);
}

playAlive() {
  playAudio(1);
}

playKillAudio(int index) {
  playAudio(index + 1);
}

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class SoundService extends GetxService {
  final AudioPlayer _cachePlayer = AudioPlayer();

  final isSoundEnabled = true.obs;

  // Helper method to handle the conditional check
  Future<void> _playSound(String path) async {
    if (isSoundEnabled.value) {
      await _cachePlayer.stop(); // Stop current sound to allow rapid clicking
      await _cachePlayer.play(AssetSource(path));
    }
  }

  // Toggle method for settings menu
  void toggleSound() {
    isSoundEnabled.value = !isSoundEnabled.value;
  }

  // Updated methods using the helper
  Future<void> playClick() => _playSound('audio/press-click.wav');
  Future<void> playPress() => _playSound('audio/regular-click.wav');
  Future<void> singleKeyPress() => _playSound('audio/single-key-press.wav');
  Future<void> childLaugh() => _playSound('audio/child-laugh.wav');
  Future<void> eventSound() => _playSound('audio/event-come.wav');
  Future<void> cancelClick() => _playSound('audio/cancel-click.wav');
  Future<void> saberCut() => _playSound('audio/saber-cut.mp3');
}
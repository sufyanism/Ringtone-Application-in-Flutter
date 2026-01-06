import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import '../model/ringtone_model.dart';
import '../service/ringtone_service.dart';
import 'package:audioplayers/audioplayers.dart';


class RingtoneController extends GetxController {
  var ringtones = <Ringtone>[].obs;
  var isPlaying = false.obs;
  var currentRingtone = ''.obs;

  final AudioPlayer audioPlayer = AudioPlayer();
  Timer? _stopTimer;

  @override
  void onInit() {
    super.onInit();
    ringtones.value = RingtoneService.getRingtones();
  }

  /// ▶️ Play ringtone and auto-stop after [duration] seconds
  void playRingtone(String fileName, int duration) async {
    try {
      // Stop previous ringtone & timer
      _stopTimer?.cancel();
      await audioPlayer.stop();

      await audioPlayer.play(
        AssetSource('ringtones/$fileName'),
      );

      isPlaying.value = true;
      currentRingtone.value = fileName;

      // ⏱ Auto stop after duration
      _stopTimer = Timer(Duration(seconds: duration), () {
        stopRingtone();
      });
    } catch (e) {
      print("Error playing ringtone: $e");
    }
  }

  void stopRingtone() {
    _stopTimer?.cancel();
    audioPlayer.stop();
    isPlaying.value = false;
    currentRingtone.value = '';
  }

  @override
  void onClose() {
    _stopTimer?.cancel();
    audioPlayer.dispose();
    super.onClose();
  }

  Future<void> downloadRingtone(Ringtone ringtone) async {
    try {

      final Directory dir = await getApplicationDocumentsDirectory();
      final Directory ringtoneDir =
      Directory('${dir.path}/Ringtones');

      if (!await ringtoneDir.exists()) {
        await ringtoneDir.create(recursive: true);
      }

      final byteData =
      await rootBundle.load('assets/ringtones/${ringtone.fileName}');

      final file = File('${ringtoneDir.path}/${ringtone.fileName}');
      await file.writeAsBytes(
        byteData.buffer.asUint8List(
          byteData.offsetInBytes,
          byteData.lengthInBytes,
        ),
      );

      Get.snackbar(
        'Download complete',
        '${ringtone.name} saved successfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Download failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}

import '../model/ringtone_model.dart';

class RingtoneService {
  static List<Ringtone> getRingtones() {
    return [
      // 🔹 5 Seconds ringtones
      Ringtone(name: 'Classic Short', fileName: 'ring1.mp3', duration: 5),
      Ringtone(name: 'Beep Short', fileName: 'ring2.mp3', duration: 5),
      Ringtone(name: 'Pop Short', fileName: 'ring3.mp3', duration: 5),
      Ringtone(name: 'Tone 4', fileName: 'ring4.mp3', duration: 5),
      Ringtone(name: 'Tone 5', fileName: 'ring5.mp3', duration: 5),

      // 🔹 22 Seconds ringtones
      Ringtone(name: 'Classic Long', fileName: 'ring6.mp3', duration: 22),
      Ringtone(name: 'Melody Long', fileName: 'ring7.mp3', duration: 22),
      Ringtone(name: 'Soft Tune', fileName: 'ring8.mp3', duration: 22),
      Ringtone(name: 'Tone 9', fileName: 'ring9.mp3', duration: 22),
      Ringtone(name: 'Tone 10', fileName: 'ring10.mp3', duration: 22),
    ];
  }
}

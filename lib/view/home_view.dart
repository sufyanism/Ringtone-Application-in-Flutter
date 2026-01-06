import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ringtone_controller.dart';
import '../model/ringtone_model.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final RingtoneController controller = Get.put(RingtoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Ringtones',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final fiveSec =
        controller.ringtones.where((r) => r.duration == 5).toList();
        final twentyTwoSec =
        controller.ringtones.where((r) => r.duration == 22).toList();

        return ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            _sectionHeader('5 Seconds Ringtones', Icons.timer),
            const SizedBox(height: 12),
            ...fiveSec.map(_ringtoneTile),

            const SizedBox(height: 28),

            _sectionHeader('22 Seconds Ringtones', Icons.schedule),
            const SizedBox(height: 12),
            ...twentyTwoSec.map(_ringtoneTile),
          ],
        );
      }),
    );
  }

  // 🔹 Section Header
  Widget _sectionHeader(String title, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Ringtone Tile (with Download)
  Widget _ringtoneTile(Ringtone ringtone) {
    final isCurrent =
        controller.currentRingtone.value == ringtone.fileName;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isCurrent ? Colors.blue.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: isCurrent
            ? Border.all(color: Colors.blue, width: 1.2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor:
          isCurrent ? Colors.blue : Colors.grey.shade300,
          child: Icon(
            isCurrent ? Icons.equalizer : Icons.music_note,
            color: Colors.white,
          ),
        ),
        title: Text(
          ringtone.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: isCurrent ? Colors.blue.shade900 : Colors.black87,
          ),
        ),
        subtitle: Text(
          '${ringtone.duration} seconds',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
          ),
        ),

        // ▶️ Play + ⬇️ Download
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isCurrent
                    ? Icons.stop_circle_rounded
                    : Icons.play_circle_fill_rounded,
                size: 34,
                color: isCurrent ? Colors.redAccent : Colors.green,
              ),
              onPressed: isCurrent
                  ? controller.stopRingtone
                  : () => controller.playRingtone(
                ringtone.fileName,
                ringtone.duration,
              ),
            ),
            IconButton(
              tooltip: 'Download',
              icon: Icon(
                Icons.download_rounded,
                color: Colors.grey.shade700,
              ),
              onPressed: () {
                controller.downloadRingtone(ringtone);
              },
            ),
          ],
        ),
      ),
    );
  }
}

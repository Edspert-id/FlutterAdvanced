import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  const LessonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Pilih Mata Pelajaran',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(onPressed: () {}, child: const Text('Lihat Semua')),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 96,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  height: 53,
                  width: 53,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F7F8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Matematika'),
                      Text('0/50 Paket Latihan Soal'),
                      LinearProgressIndicator(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

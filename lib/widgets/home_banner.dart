import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 317,
      height: 147,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF3A7FD5),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 12, left: 12),
                child: Text(
                  'Mau kerjain\nlatihan soal\napa hari ini?',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/images/home-banner.png'))),
        ],
      ),
    );
  }
}

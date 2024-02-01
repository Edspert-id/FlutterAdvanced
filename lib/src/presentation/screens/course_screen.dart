import 'package:flutter/material.dart';

import '../../domain/entities/course_model.dart';
import '../widgets/course_card.dart';

class CourseScreen extends StatelessWidget {
  final List<CourseData> courseList;

  const CourseScreen({
    super.key,
    required this.courseList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pilih Pelajaran',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF3A7FD5),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => CourseCard(course: courseList[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: courseList.length,
        shrinkWrap: true,
      ),
    );
  }
}

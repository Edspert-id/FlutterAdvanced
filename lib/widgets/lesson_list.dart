import 'package:flutter/material.dart';
import 'package:flutter_advance/model/course/course_model.dart';
import 'package:flutter_advance/screen/course_screen.dart';
import 'package:flutter_advance/widgets/course_card.dart';

class LessonList extends StatelessWidget {
  final List<CourseData> courses;

  const LessonList({
    super.key,
    required this.courses,
  });

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
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CourseScreen(courseList: courses),
                      ));
                },
                child: const Text('Lihat Semua')),
          ],
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final course = courses[index];

              return CourseCard(course: course);
            },
          ),
        ),
      ],
    );
  }
}

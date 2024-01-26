import 'package:flutter/material.dart';
import 'package:flutter_advance/model/course/course_model.dart';
import 'package:flutter_advance/screen/exercise_screen.dart';

class CourseCard extends StatelessWidget {
  final CourseData course;

  const CourseCard({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExerciseScreen(
              courseId: course.courseId ?? '',
              title: course.courseName ?? '',
            ),
          )),
      child: Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    course.urlCover ?? '',
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(course.courseName ?? 'No Name'),
                    const Text('0/50 Paket Latihan Soal'),
                    const LinearProgressIndicator(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/courses_model.dart';
import '../providers/courses_provider.dart';
import '../theme/theme.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key, required this.courseName});

  final String courseName;

  void _addScore(BuildContext context, Course course) async {
    CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );

    if (newScore != null) {
      final provider = Provider.of<CoursesProvider>(context, listen: false);
      await provider.addScore(course, newScore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursesProvider>(
      builder: (ctx, provider, child) {
        final course = provider.getCourseFor(courseName)!;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: mainColor,
            title: Text(
              course.name,
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () => _addScore(context, course),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: course.scores.length,
            itemBuilder: (ctx, index) => ScoreTile(score: course.scores[index]),
          ),
        );
      },
    );
  }
}

class ScoreTile extends StatelessWidget {
  const ScoreTile({super.key, required this.score});

  final CourseScore score;

  Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(score.studentName),
      trailing: Text(
        score.studentScore.toString(),
        style: TextStyle(color: scoreColor(score.studentScore), fontSize: 15),
      ),
    );
  }
}

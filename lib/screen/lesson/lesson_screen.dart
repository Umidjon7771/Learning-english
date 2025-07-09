import 'package:flutter/material.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4A90E2), Colors.white],
              stops: [0.3, 0.3],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(
                        'Darslar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Level: Intermediate',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Lessons List
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView.builder(
                      padding: EdgeInsets.all(20),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return _buildLessonCard(index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLessonCard(int index) {
    List<Map<String, dynamic>> lessons = [
      {
        'title': 'Modal Verbs',
        'progress': 0.0,
        'icon': '🔒',
        'color': Colors.grey,
      },
      {
        'title': 'Conditional Sentences',
        'progress': 0.0,
        'icon': '🔒',
        'color': Colors.grey,
      },
      {
        'title': 'Passive Voice',
        'progress': 0.0,
        'icon': '🔒',
        'color': Colors.grey,
      },
      {
        'title': 'Reported Speech',
        'progress': 0.0,
        'icon': '🔒',
        'color': Colors.grey,
      },
      {
        'title': 'Phrasal Verbs',
        'progress': 0.0,
        'icon': '🔒',
        'color': Colors.grey,
      },
    ];

    final lesson = lessons[index];

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: lesson['color'].withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(lesson['icon'], style: TextStyle(fontSize: 20)),
          ),
        ),
        title: Text(
          lesson['title'],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: lesson['progress'],
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(lesson['color']),
              minHeight: 6,
            ),
            SizedBox(height: 8),
            Text(
              lesson['progress'] == 1.0
                  ? 'Tugatildi'
                  : lesson['progress'] > 0
                      ? 'Jarayonda'
                      : 'Boshlanmagan',
              style: TextStyle(
                fontSize: 12,
                color: lesson['color'],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[400],
          size: 16,
        ),
      ),
    );
  }
}

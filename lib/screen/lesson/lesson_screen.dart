import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_english/screen/lesson/conditional.dart';
import 'package:learning_english/screen/lesson/modal_verbs.dart';
import 'package:learning_english/screen/lesson/passive_voice.dart';
import 'package:learning_english/screen/lesson/phrasel_verbs.dart';
import 'package:learning_english/screen/lesson/reported_speech.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildLessonCard(int index) {
      List<Map<String, dynamic>> lessons = [
        {'title': 'Modal Verbs', 'color': Colors.grey, 'icon': "🎓"},
        {'title': 'Conditional Sentences', 'color': Colors.grey, 'icon': "🎓"},
        {'title': 'Passive Voice', 'color': Colors.grey, 'icon': "🎓"},
        {'title': 'Reported Speech', 'color': Colors.grey, 'icon': "🎓"},
        {'title': 'Phrasal Verbs', 'color': Colors.grey, 'icon': "🎓"},
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
          onTap: () {
            if (index == 0) {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => ModalVerbsPage()));
            } else if (index == 1) {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => ConditionalPage()));
            } else if (index == 2) {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => PassiveVoicePage()));
            } else if (index == 3) {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => ReportedSpeechPage()));
            } else if (index == 4) {
              Navigator.push(context,
                  CupertinoPageRoute(builder: (context) => PhrasalVerbsPage()));
            }
          },
          contentPadding: EdgeInsets.all(16),
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: lesson['color'].withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                lesson['icon'],
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lesson['title'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF2C3E50),
                ),
              ),
              if (lesson['subtitle'] != null)
                Text(
                  lesson['subtitle'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
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
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Darslar',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
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
                          'Level: Beginner',
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
                      physics: BouncingScrollPhysics(),
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
}

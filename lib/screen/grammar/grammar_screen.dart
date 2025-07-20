import 'package:flutter/material.dart';
import 'package:learning_english/components/detail_component.dart';
import 'package:learning_english/screen/grammar/future_continious.dart';
import 'package:learning_english/screen/grammar/future_perfect.dart';
import 'package:learning_english/screen/grammar/future_perfect_cont.dart';
import 'package:learning_english/screen/grammar/future_simple.dart';
import 'package:learning_english/screen/grammar/past_continuos.dart';
import 'package:learning_english/screen/grammar/past_perfect.dart';
import 'package:learning_english/screen/grammar/past_perfect_continious.dart';
import 'package:learning_english/screen/grammar/past_simple.dart';
import 'package:learning_english/screen/grammar/present_continious.dart';
import 'package:learning_english/screen/grammar/present_perfect.dart';
import 'package:learning_english/screen/grammar/present_perfect_continious.dart';
import 'package:learning_english/screen/grammar/present_simple.dart';

class GrammarScreen extends StatelessWidget {
  const GrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> lessons = [
      {
        'title': 'Present Simple',
        'progress': 1.0,
        'color': Colors.green,
        "path": '/present_simple',
      },
      {
        'title': 'Present Perfect',
        'progress': 0.8,
        'color': Colors.orange,
        'path': '/present_perfect'
      },
      {
        'title': 'Present Continuous',
        'progress': 0.0,
        'color': Colors.grey,
        'path': '/present_continuous'
      },
      {
        'title': 'Present Perfect Continuous',
        'progress': 0.0,
        'color': Colors.grey,
        'path': '/present_perfect_continuous'
      },
      {
        'title': 'Past Simple',
        'progress': 0.0,
        'color': Colors.grey,
        'path': '/past_simple'
      },
      {
        'title': 'Past Continuous',
        'progress': 0.0,
        'color': Colors.grey,
        'path': '/past_continuous'
      },
      {
        'title': 'Past Perfect',
        'progress': 0.0,
        'color': Colors.grey,
        'path': '/past_perfect'
      },
      {
        'title': 'Past Perfect Continuous',
        'color': Colors.grey,
        'path': '/past_perfect_continuous'
      },
      {'title': 'Future Simpe', 'color': Colors.grey, 'path': '/future_simple'},
      {
        'title': 'Future Perfect',
        'color': Colors.grey,
        'path': '/future_perfect'
      },
      {'title': 'Future Continuous', 'path': '/future_continuous'},
      {
        'title': 'Future Perfect Continuous',
        'path': '/future_perfect_continuous'
      },
    ];

    void navigate(Map<String, dynamic> lesson) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            if (lesson['path'] == '/present_simple') {
              return PresentSimplePage();
            } else if (lesson['path'] == '/present_perfect') {
              return PresentPerfectPage();
            } else if (lesson['path'] == '/present_continuous') {
              return PresentContiniousPage();
            } else if (lesson['path'] == '/present_perfect_continuous') {
              return PresentPerfectContiniousPage();
            } else if (lesson['path'] == '/past_simple') {
              return PastSimplePage();
            } else if (lesson['path'] == '/past_continuous') {
              return PastPerfectCont();
            } else if (lesson['path'] == '/past_perfect') {
              return PastPerfectPage();
            } else if (lesson['path'] == '/past_perfect_continuous') {
              return PastPerfectContiniousPage();
            } else if (lesson['path'] == '/future_simple') {
              return FutureSimplePage();
            } else if (lesson['path'] == '/future_perfect') {
              return FuturePerfectPage();
            } else if (lesson['path'] == '/future_continuous') {
              return FutureContiniousPage();
            } else if (lesson['path'] == '/future_perfect_continuous') {
              return FuturePerfectContPage();
            } else {
              return Scaffold();
            }
          },
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
              colors: [Colors.blue, Colors.white],
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Center(
                        child: Text(
                          'Tenses',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
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
                      itemCount: lessons.length,
                      itemBuilder: (context, index) {
                        return MyWidget(
                          index: index,
                          onTap: () => navigate(lessons[index]),
                          lesson: lessons[index],
                        );
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

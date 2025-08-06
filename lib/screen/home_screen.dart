import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_english/screen/grammar/grammar_screen.dart';
import 'package:learning_english/screen/lesson/lesson_screen.dart';
import 'package:learning_english/screen/listen_screen.dart';
import 'package:learning_english/screen/reading_page.dart';
import 'package:learning_english/screen/vocabulary_screen.dart';
import 'package:learning_english/screen/writing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF4A90E2),
                Color(0xFF7B68EE),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // 'Salom, username!',
                            'Learn English with us',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bugun ingliz tilini o\'rganamiz',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color:
                              ColorScheme.of(context).primary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Scaffold(
                                  body: Scaffold(
                                    appBar: AppBar(
                                      leading: IconButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          icon: Icon(Icons.arrow_back_ios)),
                                    ),
                                    body: Center(
                                      child: Text(
                                          "You do not have any notifications!"),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.notifications_outlined,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Categories
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kategoriyalar',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2C3E50),
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: GridView.count(
                              physics: BouncingScrollPhysics(),
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 15,
                              children: [
                                _buildCategoryCard(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LessonsScreen()));
                                  },
                                  emoji: 'assets/icons/books.svg',
                                  title: 'Darslar',
                                  // subtitle: '45 dars',
                                  color: Colors.orange,
                                  bgColor: Colors.orange[100]!,
                                ),
                                _buildCategoryCard(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                VocabularyScreen()));
                                  },
                                  emoji: 'assets/icons/words.svg',
                                  title: 'So\'zlar',
                                  // subtitle: '1,200 so\'z',
                                  color: Colors.green,
                                  bgColor: Colors.green[100]!,
                                ),
                                _buildCategoryCard(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GrammarScreen()));
                                  },
                                  emoji: 'assets/icons/grammar.svg',
                                  title: 'Grammatika',
                                  // subtitle: '28 mavzu',
                                  color: Colors.purple,
                                  bgColor: Colors.purple[100]!,
                                ),
                                _buildCategoryCard(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                ListenScreen()));
                                  },
                                  emoji: 'assets/icons/listening.svg',
                                  title: 'Tinglash',
                                  // subtitle: '30 audio',
                                  color: Colors.blue,
                                  bgColor: Colors.blue[100]!,
                                ),
                                _buildCategoryCard(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => WritingScreen(),
                                      ),
                                    );
                                  },
                                  emoji: 'assets/icons/writing.svg',
                                  title: 'Writing',
                                  // subtitle: '25 mashq',
                                  color: Colors.red,
                                  bgColor: Colors.red[100]!,
                                ),
                                _buildCategoryCard(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => ReadingPage(),
                                      ),
                                    );
                                  },
                                  emoji: 'assets/icons/reading.svg',
                                  title: 'O\'qish',
                                  // subtitle: '40 matn',
                                  color: Colors.teal,
                                  bgColor: Colors.teal[100]!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  Widget _buildStatItem(String emoji, String number, String label) {
    return Column(
      children: [
        Text(emoji, style: TextStyle(fontSize: 24)),
        SizedBox(height: 5),
        Text(
          number,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildCategoryCard({
    required VoidCallback onTap,
    required String emoji,
    required String title,
    // required String subtitle,
    required Color color,
    required Color bgColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                emoji,
                width: 65,
                height: 65,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
              SizedBox(height: 5),
              // Text(
              //   subtitle,
              //   style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  int index;
  void Function()? onTap;
  final Map<String, dynamic> lesson;
  MyWidget(
      {super.key,
      required this.index,
      required this.onTap,
      required this.lesson});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    final lesson = widget.lesson;
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:learning_english/service/network_service.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({super.key});

  @override
  State<WritingScreen> createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  final TextEditingController controller = TextEditingController();
  String text = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("write and check your writing section"),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Write your essay here...',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 16,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade600,
                      foregroundColor: Colors.white,
                      elevation: 8,
                      shadowColor: Colors.indigo.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: isLoading
                        ? null
                        : () async {
                            if (controller.text.trim().isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Iltimos, matn kiriting')),
                              );
                              return;
                            }
                            setState(() {
                              isLoading = true;
                              text = 'Javob kutilmoqda...';
                            });

                            try {
                              final ai = AIService();
                              // Retry mexanizmi bilan
                              final result = await ai.sendPromptWithRetry(
                                  controller.text +
                                      'check this sentense if it has error let me know');

                              setState(() {
                                text = result;
                                isLoading = false;
                              });
                            } catch (e) {
                              setState(() {
                                text = 'Xatolik yuz berdi: $e';
                                isLoading = false;
                              });
                            }
                          },
                    child: isLoading
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 16,
                                height: 16,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              ),
                              SizedBox(width: 8),
                              Text('AI is checking...'),
                            ],
                          )
                        : Text(
                            '   Check   ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      text.isEmpty ? 'AI\'s reponse: ' : text,
                      style: TextStyle(
                        color: text.isEmpty ? Colors.grey : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

class ConditionalPage extends StatelessWidget {
  const ConditionalPage({super.key});

  final List<Map<String, dynamic>> conditionals = const [
    {
      'type': 'Zero Conditional',
      'structure': 'If + present simple, present simple',
      'example': 'If you heat water, it boils.',
      'translation': 'Agar suvni qizdirsangiz, u qaynaydi.',
      'usage': 'Facts and general truths.',
      'color': Colors.blue
    },
    {
      'type': 'First Conditional',
      'structure': 'If + present simple, will + verb',
      'example': 'If it rains, I will stay at home.',
      'translation': 'Agar yomg‘ir yog‘sa, uyda qolaman.',
      'usage': 'Real future possibilities.',
      'color': Colors.green
    },
    {
      'type': 'Second Conditional',
      'structure': 'If + past simple, would + verb',
      'example': 'If I was rich, I would buy a Mercedes.',
      'translation': 'Agar men boy bo‘lganimda, Mercedes sotib olardim.',
      'usage': 'Imaginary or unreal situations.',
      'color': Colors.orange
    },
    {
      'type': 'Third Conditional',
      'structure': 'If + past perfect, would have + V3',
      'example': 'If I had studied, I would have passed the exam.',
      'translation': 'Agar o‘qiganimda, imtihondan o‘tgan bo‘lardim.',
      'usage': 'Past regrets or unreal past.',
      'color': Colors.red
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎓 Conditionals'),
        centerTitle: true,
        elevation: 5,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          itemCount: conditionals.length,
          itemBuilder: (context, index) {
            final item = conditionals[index];
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: item['color'].withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: item['color'].withOpacity(0.6),
                    offset: const Offset(0, 6),
                    blurRadius: 12,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['type'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.schema, color: Colors.white70),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['structure'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.translate, color: Colors.white70),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['example'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              item['translation'],
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.lightbulb_outline,
                          color: Colors.white70),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item['usage'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ReportedSpeechPage extends StatelessWidget {
  const ReportedSpeechPage({super.key});

  @override
  Widget build(BuildContext context) {
    final examples = [
      {
        'direct': 'She said, "I am tired."',
        'reported': 'She said that she was tired.'
      },
      {
        'direct': 'He said, "I will call you."',
        'reported': 'He said that he would call me.'
      },
      {
        'direct': 'They said, "We are leaving now."',
        'reported': 'They said that they were leaving then.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Reported Speech',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              Text(
                'Reported Speech nima?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Reported Speech – bu kimdir aytgan gapni boshqacha shaklda (indirect) yetkazish. Odatda zamonlar o‘zgaradi.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.indigo.shade100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('⏳ Zamon o‘zgarishi:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text(
                        '• Present ➜ Past\n• will ➜ would\n• can ➜ could\n• now ➜ then\n• today ➜ that day'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Misollar:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              ...examples.map((e) => ReportedCard(e)).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportedCard extends StatelessWidget {
  final Map example;

  const ReportedCard(this.example, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('🗣️ Direct speech:',
                style: TextStyle(color: Colors.grey)),
            Text(
              example['direct'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            const Text('🔁 Reported speech:',
                style: TextStyle(color: Colors.grey)),
            Text(
              example['reported'],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

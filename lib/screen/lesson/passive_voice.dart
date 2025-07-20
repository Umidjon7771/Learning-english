import 'package:flutter/material.dart';

class PassiveVoicePage extends StatelessWidget {
  const PassiveVoicePage({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Text('Passive Voice'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            _buildSectionTitle("📘 What is Passive Voice?"),
            _buildCard(
              "Passive voice is used when the focus is on the action, "
              "not who or what is performing the action.",
            ),
            _buildSectionTitle("🧩 Structure"),
            _buildCard(
                "🔹 Object + to be + past participle (V3) + (by agent)\n\n"
                "E.g.: The cake **was eaten** (by the boy)."),
            _buildSectionTitle("📊 Tense Examples"),
            _buildCardList([
              {
                "tense": "Present Simple",
                "example": "The car **is washed** every week."
              },
              {
                "tense": "Past Simple",
                "example": "The letter **was sent** yesterday."
              },
              {
                "tense": "Future Simple",
                "example": "The room **will be cleaned** tomorrow."
              },
              {
                "tense": "Present Continuous",
                "example": "The house **is being painted**."
              },
              {
                "tense": "Present Perfect",
                "example": "The files **have been uploaded**."
              },
            ]),
            _buildSectionTitle("📝 When to Use Passive"),
            _buildCardList([
              {
                "point": "When the doer is unknown",
                "example": "My bag was stolen."
              },
              {
                "point": "When the doer is not important",
                "example": "English is spoken here."
              },
              {
                "point": "When we want to be formal or polite",
                "example": "A mistake has been made."
              },
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple),
      ),
    );
  }

  Widget _buildCard(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        ],
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 15.5, height: 1.5),
      ),
    );
  }

  Widget _buildCardList(List<Map<String, String>> items) {
    return Column(
      children: items.map((item) {
        return _buildCard(
          "🔸 ${item['tense'] ?? item['point']}\n"
          "💬 ${item['example']}",
        );
      }).toList(),
    );
  }
}

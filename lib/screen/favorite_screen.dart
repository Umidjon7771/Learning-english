import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:lottie/lottie.dart'; // Agar kerak bo'lsa

class LikedPage extends StatefulWidget {
  const LikedPage({super.key});

  @override
  State<LikedPage> createState() => _LikedPageState();
}

class _LikedPageState extends State<LikedPage> {
    final FlutterTts flutterTts = FlutterTts();

      void _speak(String text) async {
    await flutterTts.setLanguage("en-US"); // Inglizcha tilda o'qiydi
    await flutterTts.setPitch(1); // Ovoz ohangi
    await flutterTts.speak(text); // Matnni o'qish
  }
  List<Map<String, String>> likedWords = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadLikedWords();
  }

  Future<void> _loadLikedWords() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> likedWordIds = prefs.getStringList('liked_words') ?? [];
    
    List<Map<String, String>> words = [];
    
    for (String wordId in likedWordIds) {
      String? word = prefs.getString('word_$wordId');
      String? translation = prefs.getString('translation_$wordId');
      String? example = prefs.getString('example_$wordId');
      String? translationExample = prefs.getString('translationExample_$wordId');
      
      if (word != null && translation != null && example != null && translationExample != null) {
        words.add({
          'word': word,
          'translation': translation,
          'example': example,
          'translationExample': translationExample,
        });
      }
    }
    
    setState(() {
      likedWords = words;
      isLoading = false;
    });
  }

  Future<void> _removeLikedWord(String word) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> likedWordIds = prefs.getStringList('liked_words') ?? [];
    
    likedWordIds.remove(word);
    await prefs.setStringList('liked_words', likedWordIds);
    
    // Ma'lumotlarni ham o'chirish
    await prefs.remove('word_$word');
    await prefs.remove('translation_$word');
    await prefs.remove('example_$word');
    await prefs.remove('translationExample_$word');
    
    _loadLikedWords(); // Refresh
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sevimli So'zlar"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : likedWords.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 80,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Hali sevimli so'zlar yo'q",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: likedWords.length,
                  itemBuilder: (context, index) {
                    final word = likedWords[index];
                    return _buildWordCard(word);
                  },
                ),
    );
  }

  Widget _buildWordCard(Map<String, String> word) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // So'z va tugmalar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  word['word']!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
              IconButton(
                    onPressed: () => _speak(word['word']!),
                    icon: Icon(Icons.volume_up),
                  ),
                  SizedBox(width: 10),
              IconButton(
                onPressed: () => _removeLikedWord(word['word']!),
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            word['translation']!,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF7B68EE),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word['example']!,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  word['translationExample']!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
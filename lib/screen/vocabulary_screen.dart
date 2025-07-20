import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learning_english/models/word_model.dart';
import 'package:learning_english/service/word_service.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  final FlutterTts flutterTts = FlutterTts();

  Map<String, bool> likedWords = {};
  Future<void> _loadLikedWords() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> liked = prefs.getStringList('liked_words') ?? [];

    setState(() {
      likedWords = {};
      for (String wordId in liked) {
        likedWords[wordId] = true;
      }
    });
  }

  Future<void> _toggleLike(Word word) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> liked = prefs.getStringList('liked_words') ?? [];

    if (likedWords[word.word] == true) {
      // Remove from liked
      liked.remove(word.word);
      likedWords[word.word] = false;
      // SharedPreferences'dan ham o'chirish
      await prefs.remove('word_${word.word}');
      await prefs.remove('translation_${word.word}');
      await prefs.remove('example_${word.word}');
      await prefs.remove('translationExample_${word.word}');
    } else {
      // Add to liked
      liked.add(word.word);
      likedWords[word.word] = true;
      // SharedPreferences'ga saqlash
      await prefs.setString('word_${word.word}', word.word);
      await prefs.setString('translation_${word.word}', word.translation);
      await prefs.setString('example_${word.word}', word.example);
      await prefs.setString(
          'translationExample_${word.word}', word.translationExample);
    }

    await prefs.setStringList('liked_words', liked);

    setState(() {}); // UI'ni yangilash
  }

  void _speak(String text) async {
    await flutterTts.setLanguage("en-US"); // Inglizcha tilda o'qiydi
    await flutterTts.setPitch(1); // Ovoz ohangi
    await flutterTts.speak(text); // Matnni o'qish
  }

  bool isPressed = true;
  final TextEditingController wordController = TextEditingController();

  List<Word> allWords = [];
  List<Word> searchedWords = [];

  @override
  void initState() {
    super.initState();
    wordController.addListener(() {
      filterWords();
      _loadLikedWords();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadLikedWords(); // Page'ga qaytganda reload qiladi
  }

  void filterWords() {
    String query = wordController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        searchedWords = allWords;
      } else {
        searchedWords = allWords
            .where((word) =>
                word.word.toLowerCase().contains(query) ||
                word.translation.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  void dispose() {
    wordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Word>>(
        future: WordService.loadWordsFromJson(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final words = snapshot.data!;
            if (allWords.isEmpty) {
              allWords = words;
              searchedWords = words;
            }
            return _buildUI(context);
          } else if (snapshot.hasError) {
            return Center(child: Text('Xatolik: ${snapshot.error}'));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF7B68EE), Colors.white],
            stops: [0.3, 0.3],
          ),
        ),
        child: Column(
          children: [
            isPressed
                ? Padding(
                    padding: const EdgeInsets.all(20),
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
                        const Text(
                          'Lug\'at',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isPressed = !isPressed;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.search,
                                color: Colors.white, size: 24),
                          ),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: wordController,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "So'z yoki tarjima qidiring...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon:
                            const Icon(Icons.search, color: Color(0xFF7B68EE)),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (wordController.text.isNotEmpty)
                              IconButton(
                                icon:
                                    const Icon(Icons.clear, color: Colors.grey),
                                onPressed: () {
                                  wordController.clear();
                                  filterWords();
                                },
                              ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isPressed = !isPressed;
                                  wordController.clear();
                                  searchedWords = allWords;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurpleAccent
                                        .withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.close,
                                      color: Color(0xFF7B68EE), size: 24),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

            // Word Cards
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: searchedWords.isEmpty && wordController.text.isNotEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              "assets/animation/no_found.json",
                              height: 300,
                              width: 300,
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Hech narsa topilmadi",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(20),
                        itemCount: searchedWords.length,
                        itemBuilder: (context, index) {
                          return _buildWordCard(searchedWords[index]);
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWordCard(Word word) {
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
                  word.word,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2C3E50),
                  ),
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => _speak(word.word),
                    icon: Icon(Icons.volume_up),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      _toggleLike(word);
                    },
                    icon: Icon(
                      (likedWords[word.word] ?? false)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 22,
                      color: (likedWords[word.word] ?? false)
                          ? Colors.red
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            word.translation,
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
                  word.example,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  word.translationExample,
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

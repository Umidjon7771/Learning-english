class Word {
  final String word;
  final String translation;
  final String example;
  final String translationExample;
  final String difficulty;

  Word({
    required this.word,
    required this.translation,
    required this.example,
    required this.translationExample,
    required this.difficulty,
  });

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      word: json['word'],
      translation: json['translation'],
      example: json['example'],
      translationExample: json['translation_example'],
      difficulty: json['difficulty'],
    );
  }
}

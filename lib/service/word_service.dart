import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:learning_english/models/word_model.dart';

sealed class WordService {
  static Future<List<Word>> loadWordsFromJson() async {
  final String jsonString = await rootBundle.loadString('assets/data/words.json');
  final List<dynamic> jsonData = jsonDecode(jsonString);
  return jsonData.map((e) => Word.fromJson(e)).toList();
}
}
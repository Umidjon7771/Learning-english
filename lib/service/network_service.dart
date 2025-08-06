import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  final String _apiKey = 'AIzaSyAuFW6Q4q0rJ_dkbA6_dQtfGLyRVX5561U';
  final String _baseUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent';

  Future<String> sendPrompt(String prompt) async {
    // Bo'sh prompt tekshirish
    if (prompt.trim().isEmpty) {
      return 'Iltimos, matn kiriting';
    }

    try {
      final uri = Uri.parse('$_baseUrl?key=$_apiKey');
      
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'User-Agent': 'Flutter App',
        },
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ],
          "generationConfig": {
            "temperature": 0.7,
            "topK": 40,
            "topP": 0.95,
            "maxOutputTokens": 1024,
          },
          "safetySettings": [
            {
              "category": "HARM_CATEGORY_HARASSMENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_HATE_SPEECH", 
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            },
            {
              "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
              "threshold": "BLOCK_MEDIUM_AND_ABOVE"
            }
          ]
        }),
      ).timeout(Duration(seconds: 30)); // Timeout qo'shish

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Xatolik borligini tekshirish
        if (data['error'] != null) {
          return 'API Error: ${data['error']['message']}';
        }
        
        final candidates = data['candidates'];
        if (candidates == null || candidates.isEmpty) {
          return 'Javob topilmadi';
        }
        
        final content = candidates[0]['content'];
        if (content == null) {
          return 'Kontent topilmadi';
        }
        
        final parts = content['parts'];
        if (parts == null || parts.isEmpty) {
          return 'Matn qismi topilmadi';
        }
        
        final text = parts[0]['text'];
        return text ?? 'Bo\'sh javob';
        
      } else if (response.statusCode == 503) {
        return 'Xizmat vaqtincha mavjud emas. Iltimos, keyinroq urinib ko\'ring.';
      } else if (response.statusCode == 429) {
        return 'Juda ko\'p so\'rov yuborildi. Iltimos, biroz kuting.';
      } else if (response.statusCode == 400) {
        return 'Noto\'g\'ri so\'rov. API key yoki so\'rov formatini tekshiring.';
      } else if (response.statusCode == 401 || response.statusCode == 403) {
        return 'API key noto\'g\'ri yoki ruxsat yo\'q.';
      } else {
        return 'Xatolik: ${response.statusCode} - ${response.reasonPhrase}';
      }
      
    } on http.ClientException catch (e) {
      return 'Network xatosi: $e';
    } on FormatException catch (e) {
      return 'JSON parse xatosi: $e';
    } catch (e) {
      return 'Kutilmagan xatolik: $e';
    }
  }

  // Retry mexanizmi bilan
  Future<String> sendPromptWithRetry(String prompt, {int maxRetries = 3}) async {
    for (int i = 0; i < maxRetries; i++) {
      final result = await sendPrompt(prompt);
      
      // Agar 503 xatosi bo'lsa, qayta urinish
      if (result.contains('503') || result.contains('vaqtincha mavjud emas')) {
        if (i < maxRetries - 1) {
          await Future.delayed(Duration(seconds: (i + 1) * 2)); // 2, 4, 6 soniya kutish
          continue;
        }
      }
      
      return result;
    }
    
    return 'Xizmat mavjud emas. Iltimos, keyinroq urinib ko\'ring.';
  }
}
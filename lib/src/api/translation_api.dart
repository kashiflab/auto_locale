import 'dart:convert';
import 'package:http/http.dart' as http;

/// Created By Kashif Ali Bhatti on 2023-10-20
/// A class to handle translation using Google Translate API
class TranslationApi {
  /// Method to translate text from one language to multiple target languages
  ///
  /// @param text The text to be translated
  /// @param sourceLang The language code of the source text
  /// @param targetLangs A list of language codes for the target languages
  /// @return A Future that resolves to a map of translated texts
  Future<Map<String, String>> translate(
      String text, String sourceLang, List<String> targetLangs) async {
    Map<String, String> translations = {};
    for (String targetLang in targetLangs) {
      final url = Uri.parse(
          'https://translate.googleapis.com/translate_a/t?client=gtx&dt=t&sl=$sourceLang&tl=$targetLang&q=${Uri.encodeComponent(text)}');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> body = json.decode(response.body);
        translations[targetLang] = body[0];
      } else {
        throw Exception('Translation failed for $targetLang');
      }
    }
    return translations;
  }
}

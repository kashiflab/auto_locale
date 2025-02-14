import '../api/translation_api.dart';
import '../storage/locale_storage.dart';
import 'dart:io';
import 'dart:convert';

/// Created By Kashif Ali Bhatti on 2023-10-20
/// A repository class that handles translation and storage of translations.
class TranslationRepository {
  final TranslationApi api;
  final LocaleStorage storage;

  TranslationRepository(this.api, this.storage);

  /// Translates the content of a file and stores the translated content.
  ///
  /// @param filePath The path to the source file to be translated.
  /// @param sourceLang The language code of the source language.
  /// @param targetLangs A list of target language codes.
  /// @throws Exception if the source file is not found.
  Future<void> translateAndStore(
      String filePath, String sourceLang, List<String> targetLangs) async {
    stdout.write('Reading source file...\n');

    final file = File(filePath);
    if (!file.existsSync()) {
      throw Exception('Source file not found');
    }
    final content = await file.readAsString();
    final Map<String, dynamic> data = json.decode(content);
    final int totalKeys = data.keys.length;

    for (String targetLang in targetLangs) {
      stdout.write('\nTranslating to ${targetLang.toUpperCase()}...\n');
      Map<String, String> translatedData = {};
      int processedKeys = 0;

      for (var key in data.keys) {
        final translations =
            await api.translate(data[key], sourceLang, [targetLang]);
        translatedData[key] = translations[targetLang] ?? '';
        processedKeys++;

        // Update progress
        final progress = (processedKeys / totalKeys * 100).toStringAsFixed(1);
        stdout.write('\rProgress: $progress% completed');
      }

      stdout.write('\nSaving ${targetLang}.json...\n');
      await storage.saveTranslation(
          filePath, sourceLang, targetLang, translatedData);
      stdout.write('✓ ${targetLang}.json created successfully!\n');
    }

    stdout.write('\n✓ All translations completed!\n');
  }
}

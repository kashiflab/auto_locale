import 'dart:io';
import 'dart:convert';

/// A class to handle locale storage operations.
///
/// Created by Kashif Ali Bhatti on 2023-10-25.
class LocaleStorage {
  /// Saves the translations to a JSON file.
  ///
  /// The file will be saved with the language code appended to the filename.
  ///
  /// @param filePath The path of the file where translations will be saved.
  /// @param lang The language code for the translations.
  /// @param sourceLang The language code of the source language.
  /// @param translations A map containing the translations.
  Future<void> saveTranslation(String filePath, String sourceLang, String lang,
      Map<String, String> translations) async {
    final file = File(filePath.replaceAll('$sourceLang.json', '$lang.json'));
    await file.writeAsString(json.encode(translations));
  }
}
